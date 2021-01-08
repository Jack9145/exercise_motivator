class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.decimal :height ,precision: 4, scale: 1, null: false
      t.decimal :weight , precision: 4, scale: 1, null: false
      t.decimal :fat_rate, precision: 3, scale: 1
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
