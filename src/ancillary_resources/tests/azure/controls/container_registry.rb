
title "Container Registry"

control "azure-container-registry" do
    desc "Ensure the deployed container registry has been configured correctly"

    only_if { input('container_registry_name') != 0 }

    # Ensure that the container registry exists and is the correct location
    describe azure_container_registry(resource_group: input("resource_group_name"), name: input("container_registry_name")) do
        it { should exist }
        its("location") { should cmp input("region") }
        its("properties.provisioningState") { should cmp "Succeeded" }
        its("properties.policies.retentionPolicy.status") { should cmp "disabled" }
    end
end
