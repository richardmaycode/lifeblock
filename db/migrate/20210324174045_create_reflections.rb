class CreateReflections < ActiveRecord::Migration[6.1]
  def change
    create_table :reflections do |t|
      t.date :completed, null: false
      t.integer :mood, null: false
      t.text :note

      t.belongs_to :account, index: true, null: false, foreign_key: true
      t.belongs_to :creator, index: true, null: false, foreign_key: { to_table: :users }
      
      t.index [:completed, :account_id], unique: true
      
      t.timestamps
    end
  end
end
