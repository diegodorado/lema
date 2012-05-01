class AddLogicToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string :section
      t.boolean :draft
      t.boolean :history
    end  
  end
end
