title "Log Analytics Workspace"

control "azure-log_analytics" do
    desc "Ensures that the Log Analytics workspace has been deployed and configured correctly"

    only_if { input("la_workspace") != "" }

    describe azure_generic_resource(resource_group: input("resource_group_name"), name: input("la_workspace")) do
        it { should exist }
        its("location") { should cmp input("region") }
        its("properties.sku.name") { should cmp input("la_sku")}
        its("properties.retentionInDays") { should cmp input("la_retention") }
        its("properties.provisioningState") { should cmp "Succeeded" }
    end
end