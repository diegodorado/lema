class AddDescriptionToFooterLinks < ActiveRecord::Migration
  def change
    add_column :footer_links, :description, :text
  end
end
