class Post < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, as: :pictureable
  attr_accessible :body, :published_at, :seo_description, :seo_title, :title, :user_id
end
