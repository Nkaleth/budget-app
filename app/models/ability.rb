class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.author?

    can :read, Category, author_id: user.id
    can :read, Payment, author_id: user.id
  end
end
