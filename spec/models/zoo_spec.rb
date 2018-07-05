RSpec.describe Zoo do
  it "has a valid factory" do
    expect(create(:zoo)).to be_valid
  end
end
