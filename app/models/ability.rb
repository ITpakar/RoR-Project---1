class Ability
  include CanCan::Ability

  # def initialize(user)
  #   user ||= scope_object user
  
  #   if user.is_admin?
  #     Rails.logger.info '=========admin'
  #     can :manage, :all
  #   elsif user.is_user?

  #     Rails.logger.info '=========user'
  #     cannot :read, User
  #     can :read, Team
  #     can :manage, Profile
  #     can :read, Game
  #     can :read, Player
  #     cannot :create, Player
  #     cannot :destroy, Player
  #     cannot :edit, Player

  #   else
  #     cannot :read, Player
  #     Rails.logger.info '=========guest'
  #   end
  # end

  # def scope_object obj
  #   User.new if obj
  #   obj.is_admin? ? User.new : Admin.new
  # end


  def initialize(user)
    user ||= Admin.new
    case user
    when User
      Rails.logger.info '=========user'
      cannot :read, User
      can :read, Team
      can :manage, Profile
      can :read, Game
      can :read, Player
      cannot :create, Player
      cannot :destroy, Player
      cannot :edit, Player
    when Admin
      Rails.logger.info '=========admin'
      can :manage, :all
    else
      cannot :read, Player
      Rails.logger.info '=========guest'
    end
  end




end
