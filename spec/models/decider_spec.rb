require "rspec"



describe "Decider" do

  before(:each) do
    @decider = Decider.new
  end

  it "should be to drop the proposition when there is no votes" do
    @decider.tally([]).should be_kind_of(Decider::Drop)
  end

  it "should be to adopt the proposition when there are votes" do
    @decider.tally([Vote.make]).should be_kind_of(Decider::Adopt)
  end

end