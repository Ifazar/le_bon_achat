class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.integer :price
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
