# frozen_string_literal: true

class Answer < ApplicationRecord
  include Attachable

  belongs_to :question, touch: true
  belongs_to :user

  validates :body, presence: true
end
