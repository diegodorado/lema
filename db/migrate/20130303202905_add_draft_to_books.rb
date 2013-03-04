class AddDraftToBooks < ActiveRecord::Migration

  def up
    add_column :books, :draft, :boolean
    say_with_time "Updating draft column..." do
      Book.reset_column_information
      Book.update_all :draft => false
    end
  end

  def down
    remove_column :books, :draft
  end

end
