class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Payment, public: true

    return unless user.present? # additional permissions for logged in users (they can read their own Payments)

    can :read, Payment, user_id: user.id

    return unless user.admin? # additional permissions for administrators

    can :manage, Payment
  end
end
