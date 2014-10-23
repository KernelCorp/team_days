class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, :new,  Order
    can :show,  Order
    if user.is_a? User::Partner
      can :manage, AvailableService
      can :manage, Order
      can :manage, Payment
    end
  end
end
