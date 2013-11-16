require "test_helper"
require 'aws'
class PictureTest < ActiveSupport::TestCase

  before do
    AWS.config(access_key_id: "TESTKEY", secret_access_key: "TESTSECRET",  stub_requests: true)
    @picture = build(:picture)
  end

  after do
    AWS.config(access_key_id: nil, secret_access_key: nil, stub_requests: nil)
  end
  it "is valid when all attributes are passed in" do
    assert @picture.valid?
  end

  it "must have a picture" do
    @picture.image  = nil
    assert @picture.invalid?
  end
end
