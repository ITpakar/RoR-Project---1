class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # has_one :profile, dependent: :destroy
  has_one :profile, as: :profilable, dependent: :destroy
  belongs_to :country
  accepts_nested_attributes_for :profile, allow_destroy: true
  after_save :create_profile, :on => :create, unless: Proc.new { self.profile }

  def create_profile
    self.build_profile.save(:validation => false)
  end

  def is_admin?
    false
  end

  def is_user?
    true
  end
end
