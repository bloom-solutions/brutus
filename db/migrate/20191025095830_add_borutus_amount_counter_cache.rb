class AddBorutusAmountCounterCache < ActiveRecord::Migration[5.2]
  def change
    add_column :borutus_accounts, :borutus_amounts_count, :integer
  end
end
