require "test_helper"

class TagTest < ActiveSupport::TestCase

  def setup
    @tag = Tag.new
  end

  def test_valid
    assert @tag.valid?
  end

end
