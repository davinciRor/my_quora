# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  def author_of?(resource)
    self.id == resource.user_id
  end
end
