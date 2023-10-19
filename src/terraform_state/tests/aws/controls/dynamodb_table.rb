title "DynamoDB Table"

control "aws-dynamodb-table" do

    desc "Ensure that the table used for Terraform state object locking exists"

    describe aws_dynamodb_table(table_name: input('dynamodb_table_name')) do
        it { should exist }
        it { should be_encrypted }

        its('table_status') { should eq 'ACTIVE' }

        its('write_capacity_units') { should eq input("dynamodb_table_write_capacity") }
        its('read_capacity_units') { should eq input("dynamodb_table_read_capacity") }

        its('sse_description.status') { should eq 'ENABLED' }
        its('sse_description.sse_type') { should eq 'KMS' }

        its('key_schema') { should include ({:attribute_name => 'LockID', :key_type => 'HASH'})}
    end
end