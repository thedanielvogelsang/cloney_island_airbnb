class RemoveCancellationPolicyTable < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :cancellation_policy, :integer, default: 0
    drop_table 'cancellations' if ActiveRecord::Base.connection.table_exists? 'cancellations'
  end
end
