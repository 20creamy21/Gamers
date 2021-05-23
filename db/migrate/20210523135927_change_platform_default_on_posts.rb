class ChangePlatformDefaultOnPosts < ActiveRecord::Migration[5.2]

  def up
    change_column :posts, :platform, :string, default: 0
  end

  def down
    change_column :posts, :platform, :string
  end

end
