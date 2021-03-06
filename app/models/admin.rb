class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, as: :profilable, dependent: :destroy
  accepts_nested_attributes_for :profile, allow_destroy: true
  after_save :create_profile, :on => :create, unless: Proc.new { self.profile }

  def create_profile
    self.build_profile.save(:validation => false)
  end

  def is_admin?
  	true
  end
  
  def is_user?
  	false
  end
end
