class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Admin.new
    case user
    when User
      Rails.logger.info '==CanCan::Ability=======user'
      cannot :read, User
      can :read, Team
      can :manage, Profile
      can :read, Game
      can :read, Player
      cannot :create, Player
      cannot :destroy, Player
      cannot :edit, Player
    when Admin
      Rails.logger.info '==CanCan::Ability=======admin'
      can :manage, :all
      cannot :create_admin, Admin
    else
      cannot :read, Player
      Rails.logger.info '===CanCan::Ability======guest'
    end
  end

end
