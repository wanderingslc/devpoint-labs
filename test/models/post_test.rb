require "test_helper"

class PostTest < ActiveSupport::TestCase

  before do
    @post = build(:post)
  end

  it "is valid with defaults" do
    assert @post.valid?
  end

  it "validates a post has a title" do
    @post.title = nil
    assert @post.invalid?
  end

  it "validates a post has a body" do
    @post.body = nil
    assert @post.invalid?
  end  
  
end
