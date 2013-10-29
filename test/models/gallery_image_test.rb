require "test_helper"

class GalleryImageTest < ActiveSupport::TestCase

  def setup
    @gallery_images = GalleryImages.new
  end

  def test_valid
    assert @gallery_images.valid?
  end

end
