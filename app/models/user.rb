class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  has_many :tags, as: :taggable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar
  validates :first_name, :last_name, presence: true
  after_create :send_welcome_email 


  has_attached_file :avatar, 
                    styles: { 
                      large: "600x600>", 
                      medium: "300x300>", 
                      small: "150x150>", 
                      thumb: "100x100>", 
                      mini: "24x24>" }
  validates_attachment  :avatar, 
                        :content_type => { :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png)$/, message: "We only accept JPG & PNG images" }

  def full_name
    first_name + ' ' + last_name
  end

  def street_name
    (first_name[0] + '-' + last_name[0..4]).to_s
  end

  private
  
  def send_welcome_email 
    UserMailer.welcome(self).deliver
  end

end
