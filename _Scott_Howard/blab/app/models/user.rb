class User < ActiveRecord::Base
  has_many :games
  has_many :challenges
  has_many :phrases #added this for user added phrases
  has_many :authentications

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :email, uniqueness: true

  #attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
  
end
