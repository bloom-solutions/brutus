class CreateBorutusTables < ActiveRecord::Migration[4.2]
  def change
    create_table :borutus_accounts do |t|
      t.string :name
      t.string :type
      t.boolean :contra

      t.timestamps
    end
    add_index :borutus_accounts, [:name, :type]

    create_table :borutus_entries do |t|
      t.string :description
      t.date :date
      t.integer :commercial_document_id
      t.string :commercial_document_type

      t.timestamps
    end
    add_index :borutus_entries, :date
    add_index :borutus_entries, [:commercial_document_id, :commercial_document_type], :name => "index_entries_on_commercial_doc"

    create_table :borutus_amounts do |t|
      t.string :type
      t.references :account
      t.references :entry
      t.decimal :amount, :precision => 20, :scale => 10
    end
    add_index :borutus_amounts, :type
    add_index :borutus_amounts, [:account_id, :entry_id]
    add_index :borutus_amounts, [:entry_id, :account_id]
  end
end
