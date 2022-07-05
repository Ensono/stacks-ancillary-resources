
title "S3 Bucket"

control "aws-s3-bucket" do

    desc "Ensure that the S3 bucket for the Terraform state files has been deployed and configured"

    describe aws_s3_bucket(bucket_name: input("s3_bucket_name")) do
        it { should exist }
        it { should_not be_public }
        it { should have_default_encryption_enabled }

        its('region') { should cmp input("region") }
        its('bucket_lifecycle_rules.count') { should eq 0 }
    end
end