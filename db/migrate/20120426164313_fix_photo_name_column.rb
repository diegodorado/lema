class FixPhotoNameColumn < ActiveRecord::Migration
  def change

    change_table :photos do |t|
      t.rename :name, :title
    end

  end
end
