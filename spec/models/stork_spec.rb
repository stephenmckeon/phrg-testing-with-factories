RSpec.describe Stork do
  it "has a valid factory" do
    expect(create(:stork)).to be_valid
  end
end
