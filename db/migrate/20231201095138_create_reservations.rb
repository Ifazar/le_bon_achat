class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :establishment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
