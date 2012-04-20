class CreatePostLinks < ActiveRecord::Migration
  def change
    create_table :post_links do |t|
      t.string :title
      t.string :url
      t.string :description
      t.integer :post_id

      t.timestamps
    end
  end
end
