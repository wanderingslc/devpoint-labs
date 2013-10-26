class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :completed_at, :description, :name, :published_at, :stats, :url, :user_id

  validates :name, :description, :user, presence: true

end
