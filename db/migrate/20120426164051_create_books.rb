class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.text :points_of_sale
      t.text :buy_online
      t.boolean :obra_escrita
      t.boolean :ticho_ediciones

      t.timestamps
    end
  end
end
