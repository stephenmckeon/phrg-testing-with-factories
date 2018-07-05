RSpec.describe Bear do
  it "has a valid factory" do
    expect(create(:bear)).to be_valid
  end
end
