class CreateFooterLinks < ActiveRecord::Migration
  def change
    create_table :footer_links do |t|
      t.string :location
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
