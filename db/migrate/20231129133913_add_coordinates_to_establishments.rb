class AddCoordinatesToEstablishments < ActiveRecord::Migration[7.1]
  def change
    add_column :establishments, :latitude, :float
    add_column :establishments, :longitude, :float
  end
end
