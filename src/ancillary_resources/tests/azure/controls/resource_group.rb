# copyright: 2018, The Authors

title "Resource Group"

control "azure-resource_group" do

  # Ensure that the resource grpup exists, is in the correct location and
  # has been provisionned successfully
  describe azure_resource_group(name: input("resource_group_name")) do
    it { should exist }
    its("location") { should cmp input("region") }
    its("properties.provisioningState") { should cmp "Succeeded" }
  end

end
