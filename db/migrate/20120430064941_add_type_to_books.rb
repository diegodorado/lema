class AddTypeToBooks < ActiveRecord::Migration
  def up
    change_table :books do |t|
      t.string :type
    end
    remove_column :books, :obra_escrita
    remove_column :books, :ticho_ediciones
  end

  def down
  end
end
