#中間テーブル
class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key:true#room_idカラム生成（外部から）
      t.references :user, null: false, foreign_key:true#user_idカラム生成（外部から）
      t.timestamps
    end
  end
end
