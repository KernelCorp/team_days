class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, :new,  Order
    can :read,  Order
    can :read, Blog::Category
    can :read, Blog::Post
    can :read, Blog::Tag
    if user.is_a? User::Partner
      can :manage, AvailableService
      can :manage, Order
      can :manage, Payment
    end
  end
end
