class AddDraftToCourses < ActiveRecord::Migration

  def up
    add_column :courses, :draft, :boolean
    say_with_time "Updating draft column..." do
      Course.reset_column_information
      Course.update_all :draft => false
    end
  end

  def down
    remove_column :courses, :draft
  end
  
end
