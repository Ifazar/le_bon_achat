class CreateEstablishments < ActiveRecord::Migration[7.1]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
