class Room < ApplicationRecord
  has_many :room_users #中間テーブルを利用して
  has_many :users, through: :room_users #多対多を表す
  validates :name, presence: true
end
