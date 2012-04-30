class RenameBookTypeColumn < ActiveRecord::Migration
  def change

    change_table :books do |t|
      t.rename :type, :section
    end

  end
end
