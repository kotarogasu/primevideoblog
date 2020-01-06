class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :category, optional: true
end
