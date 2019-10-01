# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user
      user_abilities
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, :all
  end

  def user_abilities
    can :read, :all
    can :create,  [Question, Answer]
    can :update,  [Question, Answer], user: user
    can :destroy, [Question, Answer], user: user

    can :destroy, Attachment do |attachment|
      attachment.attachable.user == user
    end
  end
end
