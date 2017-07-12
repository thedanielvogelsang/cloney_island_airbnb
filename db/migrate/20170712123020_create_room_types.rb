class CreateRoomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :room_types do |t|
      t.text :name

      t.timestamps
    end
  end
end
