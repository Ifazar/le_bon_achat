class CreateAchats < ActiveRecord::Migration[7.1]
  def change
    create_table :achats do |t|

      t.timestamps
    end
  end
end
