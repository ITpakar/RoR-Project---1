class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  after_create :create_profile#, unless: Proc.new { self.profile }

  def create_profile
    self.build_profile.save(:validation => false)
  end
  
  def admin?
  	self.role == 'admin'
  end

  def normal_user?
  	self.role == 'user'
  end
end
