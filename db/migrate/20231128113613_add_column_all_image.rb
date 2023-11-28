class AddColumnAllImage < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :picture1, :string
    add_column :products, :picture2, :string
    add_column :products, :picture3, :string
  end
end
