class AddDataToBook < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.text :specification
    end
  end
end
