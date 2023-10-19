title "DNS Zones"

control "azure-dns-zones" do
    desc "Ensure that the Zones for Stacks have been setup"

    only_if { input('dns_zones') != "" }

    # Check the public zones
    for zone in input('dns_zones').public do
        describe azure_dns_zones_resource(resource_group: input("resource_group_name"), name: zone) do
            it { should exist }
            its("location") { should cmp "global" }
            its("properties.zoneType") { should eq "Public" }
        end
    end

    # Check the private dns zones
    for zone in input('dns_zones').private do
        describe azure_generic_resource(resource_group: input("resource_group_name"), name: zone) do
            it { should exist }
            its('type') { should eq "Microsoft.Network/privateDnsZones"}
            its("location") { should cmp "global" }
            its("properties.provisioningState") { should cmp "Succeeded" }
        end        
    end
    
end
