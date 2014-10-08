class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a? User::Partner
      can :manage, AvailableService
    end
  end
end
