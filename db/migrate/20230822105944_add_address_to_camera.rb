class AddAddressToCamera < ActiveRecord::Migration[7.0]
  def change
    add_column :cameras, :address, :string
  end
end
