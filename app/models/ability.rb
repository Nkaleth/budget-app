class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category, Payment, user_id: user.id if user.author?

    return unless user.admin? # additional permissions for administrators

    can :manage, Payment, Category
  end
end
