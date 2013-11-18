class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :pictures, as: :pictureable, dependent: :destroy
  accepts_nested_attributes_for :pictures, :tags
  attr_accessible :completed_at, :description, :name, :published_at, :stats, :url, :user_id, :pictures_attributes, :tags_attributes

  validates :name, :description, :user, presence: true

end
