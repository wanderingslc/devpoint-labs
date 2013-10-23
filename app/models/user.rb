class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  validates :first_name, :last_name, presence: true
  after_create :send_welcome_email 

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
