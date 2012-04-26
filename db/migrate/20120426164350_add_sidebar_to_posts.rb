class AddSidebarToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string :sidebar_title
      t.text :sidebar_body
    end
  end
end
