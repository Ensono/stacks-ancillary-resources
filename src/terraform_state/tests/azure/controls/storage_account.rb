
title "Storage Account exists"

describe azure_storage_account(resource_group: input("resource_group_name"), name: input("storage_account_name")) do
    it { should exist }
    its("location") { should cmp input("region") }
end

# Get the locks for the storage account and check that it is set to CanNotDelete
azure_locks(resource_group: input("resource_group_name"),
            resource_name: input("storage_account_name"),
            resource_type: "Microsoft.Storage/storageAccounts").ids.each do |id|
  describe azure_lock(resource_id: id) do
    its("properties.level") { should cmp "CanNotDelete" }
  end
end

# Check that the container exists on the storage account
describe azure_storage_account_blob_container(resource_group: input("resource_group_name"), 
                                              storage_account_name: input("storage_account_name"),
                                              name: input("container_name")) do
    it { should exist }
    its("properties") { should have_attributes(publicAccess: "Container") }

    # The following test is currently commented out because it appears that the Azure
    # Resource API does not expose the soft delete option for the container
    # its("properties.remainingRetentionDays") { should cmp input("retention_days") }
end