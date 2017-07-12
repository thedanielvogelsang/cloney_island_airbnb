class CreateBedTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :bed_types do |t|
      t.text :name

      t.timestamps
    end
  end
end
