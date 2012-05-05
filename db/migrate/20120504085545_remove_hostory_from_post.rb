class RemoveHostoryFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :history
  end
end
