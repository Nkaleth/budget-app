class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.author?

    can %i[read create], Category, author_id: user.id
    can %i[read create], Payment, author_id: user.id
  end
end
