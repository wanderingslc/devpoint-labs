  # user: { first_name: 'test', ......, picture_attributes: { attributes} }
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :picture, as: :pictureable, dependent: :destroy
  accepts_nested_attributes_for :picture
  has_many :projects, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar, :picture_attributes
  validates :first_name, :last_name, presence: true
  # after_create :send_welcome_email 

  private
  
  def send_welcome_email 
    UserMailer.welcome(self).deliver
  end

end
