require "rspec"

describe TokenGenerator do
  describe "secure token" do
    subject { TokenGenerator.secure_token }

    its(:size) { should == 24 }
  end

  describe "friendly token"  do
    before do
      TokenGenerator.stub(:secure_token) { "/2BuBuLf3+WfSKyQbRcc/A==" }
    end

    it "replaces non url encoded characters" do
      TokenGenerator.friendly_token.should == "_2BuBuLf3-WfSKyQbRcc_A"
    end
  end
end