class AddImageToAsks < ActiveRecord::Migration
  def change
    add_column :asks, :image, :string
  end
end
