RSpec.describe Tiger do
  it "has a valid factory" do
    expect(create(:tiger)).to be_valid
  end
end
