class CreateCancellations < ActiveRecord::Migration[5.1]
  def change
    create_table :cancellations do |t|
      t.text :name
      t.text :refund
      t.text :description

      t.timestamps
    end
  end
end
