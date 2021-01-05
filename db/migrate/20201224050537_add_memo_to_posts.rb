class AddMemoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :memo, :text
  end
end
