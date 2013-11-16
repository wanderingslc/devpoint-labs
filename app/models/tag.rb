class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true
  attr_accessible :name
  validates :name, presence: true
end
