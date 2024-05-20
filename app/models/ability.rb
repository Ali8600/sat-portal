# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # can :create, User if user.admin?
    # can :manage, :all if user.admin?
    can :create, User unless user.admin?
    # can :create, Course unless user.teacher?

  end
end
