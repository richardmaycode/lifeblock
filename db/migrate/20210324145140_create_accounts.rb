class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.belongs_to :owner, index: true,  null: false, foreign_key: { to_table: :users}
      t.integer :role, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
