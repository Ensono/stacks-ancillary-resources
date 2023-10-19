title "KMS Key"

control "aws-kms-key" do

    desc "Ensure that the KMS key is setup correctly"

    describe aws_kms_key(key_id: input('kms_key_id')) do
        it { should exist }
        it { should be_enabled }
    end
end