class DropPostLinks < ActiveRecord::Migration
  def up
    drop_table :post_links
  end

  def down
  end
end
