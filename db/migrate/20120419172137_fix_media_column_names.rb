class FixMediaColumnNames < ActiveRecord::Migration
  def change

    change_table :posts do |t|
      t.rename :audio_url, :audio
      t.rename :video_url, :video
    end

  end
end
