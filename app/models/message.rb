class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  has_one_attached :image #messageテーブルとActive Storageテーブルのアソシエイション
  validates :content, presence: true, unless: :was_attached? #messageにしない

  def was_attached?
    self.image.attached?
  end  
end

