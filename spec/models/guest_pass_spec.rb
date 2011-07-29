require "rspec"

describe GuestPass do

  # todo: Replace with real round tripping
  # so we know we can save and retrieve with same persistent state
  describe "attributes" do
    it { should belong_to(:proposal) }
  end

  describe "when created" do
    before do
      @guest_pass = GuestPass.make(:proposal => Proposal.make!)
      @guest_pass.save!
    end

    it "generates a secret token" do
      @guest_pass.token.should_not be_nil
    end
  end
end