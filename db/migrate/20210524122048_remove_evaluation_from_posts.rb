class RemoveEvaluationFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :evaluation, :string
  end
end
