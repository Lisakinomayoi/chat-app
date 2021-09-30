class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #messageテーブルとActive Storageテーブルのアソシエイション
  validates :content, presence: true #messageにしない
end
