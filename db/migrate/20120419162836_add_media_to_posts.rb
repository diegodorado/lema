class AddMediaToPosts < ActiveRecord::Migration
  def change

    change_table :posts do |t|
      t.string :audio_url
      t.string :video_url
    end
  
  end
end
