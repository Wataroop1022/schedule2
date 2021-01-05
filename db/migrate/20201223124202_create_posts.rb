class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :day_start
      t.date :day_end
      t.boolean :all_day

      t.timestamps
    end
  end
end
