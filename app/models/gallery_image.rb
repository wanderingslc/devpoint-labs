class GalleryImage < ActiveRecord::Base
  belongs_to :projects
  attr_accessible :caption, :description, :image
  has_attached_file :image, 
                    styles: { 
                      hd: "1200x1200>", 
                      large: "600x600>", 
                      medium: "300x300>", 
                      small: "150x150>", 
                      thumb: "100x100>", 
                      mini: "24x24>" }

  validates :image, presence: true
end
