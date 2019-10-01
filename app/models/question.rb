# frozen_string_literal: true

class Question < ApplicationRecord
  include Attachable

  has_many :answers, dependent: :destroy
  belongs_to :user

  validates :title, :body, presence: true

  scope :today, -> { where('DATE(created_at) = ?', Date.today) }
end
