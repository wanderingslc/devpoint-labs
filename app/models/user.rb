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
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar, :picture_attributes, :provider, :uid
  validates :first_name, :last_name, presence: true
  after_create :send_welcome_email 

  def setup_twitter_user(auth)
    self.first_name, self.last_name = auth.info.name.split(' ')
    self.provider = auth.provider
    self.uid = auth.uid
    self.password = Devise.friendly_token[0,20]
    self.picture.image = auth.info.image
  end

  private
  
  def send_welcome_email 
    UserMailer.welcome(self).deliver
  end
  

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    user = User.new() unless user
  end

end
