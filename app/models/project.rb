class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable
  has_many :pictures, as: :pictureable
  attr_accessible :completed_at, :description, :name, :published_at, :stats, :url, :user_id

  validates :name, :description, :user, presence: true

end
