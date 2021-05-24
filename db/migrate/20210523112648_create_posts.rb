class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :name
      t.integer :platform, default: 0
      t.integer :genre, default: 0
      t.string :thought
      t.string :evaluation
      t.string :note
      t.timestamp :created_at

      t.timestamps
    end
  end
end
