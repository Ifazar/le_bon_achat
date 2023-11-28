class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :category
      t.string :title
      t.string :detail
      t.string :condition
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.references :establishment, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
