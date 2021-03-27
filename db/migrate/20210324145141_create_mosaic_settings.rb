class CreateMosaicSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :mosaic_settings do |t|
      t.boolean :show_numbers, null: false, default: true
      t.boolean :show_labels, null: false, default: true
      t.boolean :show_upcoming_dates, null: false, default: true
      t.boolean :show_skipped_days, null: false, default: true

      t.belongs_to :color_scheme, index: true, null: false, foreign_key: true
      t.belongs_to :account, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
