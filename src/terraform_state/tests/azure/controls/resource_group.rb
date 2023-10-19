# copyright: 2018, The Authors

title "Resource Group"

# Ensure that the resource grpup exists, is in the correct location and
# has been provisionned successfully
describe azure_resource_group(name: input("resource_group_name")) {
  it { should exist }
  its("location") { should cmp input("region") }
  its("properties.provisiongState") { should cmp "Succeeded" }
}

# Get the locks for the resource group and check that it is set to CanNotDelete
azure_locks(resource_group: input("resource_group_name")).ids.each do |id|
  describe azure_lock(resource_id: id) do
    its("properties.level") { should cmp "CanNotDelete" }
  end
end
