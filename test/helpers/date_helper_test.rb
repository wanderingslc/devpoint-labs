require "test_helper"

class DateHelperTest < ActionView::TestCase

  before do
    @test_date = Time.now
  end

  it "displays dates as a human date" do
    assert_equal human_date(@test_date), time_tag(@test_date.to_date)
  end

  it "displays date/times as a human date time" do
    assert_equal human_date_time(@test_date), @test_date.strftime("%A %B %d, %Y")
  end
  
end
