class CreateColorSchemes < ActiveRecord::Migration[6.1]
  def change
    create_table :color_schemes do |t|
      t.string :name, null: false
      t.integer :color, null: false, default: 0
      t.timestamps
    end
  end
end
