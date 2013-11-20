require "test_helper"

class TagTest < ActiveSupport::TestCase

  before do
    @tag = build(:tag)
  end

  it "is valid with our defaults" do
    assert @tag.valid?
  end

  it "always has a name" do
    @tag.name = nil
    assert @tag.invalid?
  end

end
