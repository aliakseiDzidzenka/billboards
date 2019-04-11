# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :billboard

  validates :body, presence: true, alow_blank: false
end
