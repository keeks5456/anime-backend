class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :likes
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
  end
end