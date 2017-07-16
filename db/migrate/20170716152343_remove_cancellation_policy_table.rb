class RemoveCancellationPolicyTable < ActiveRecord::Migration[5.1]
  def change
    remove_reference :listings, :cancellation, index: true, foreign_key: true
    add_column :listings, :cancellation_policy, :integer, default: 0
    drop_table 'cancellations' if ActiveRecord::Base.connection.table_exists? 'cancellations'
  end
end
