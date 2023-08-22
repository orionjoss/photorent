class ChangeColumnTypeNameInCameras < ActiveRecord::Migration[7.0]
  def change
    rename_column :cameras, :type, :camera_type
  end
end
