class CreateCameras < ActiveRecord::Migration[7.0]
  def change
    create_table :cameras do |t|
      t.string :type
      t.string :brand
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
