class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :content, presence: true #messageにしない
end
