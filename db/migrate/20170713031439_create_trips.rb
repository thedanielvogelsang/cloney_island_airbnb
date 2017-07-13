class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.references :host, index: true, foreign_key: { to_table: :users }
      t.integer :trip_status, default: 0
      t.date :start_date
      t.date :end_date
      t.integer :num_guests

      t.timestamps
    end
  end
end
