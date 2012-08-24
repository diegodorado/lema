class Photo < ActiveRecord::Base
  validates :image, :attachment_presence => true

  has_attached_file :image, {
      :styles => { :medium => "540x300>", :thumb => "100x100#" } #,
      #:path => ":rails_root/public/system/photos/:style/:id/:filename" 
    }

  belongs_to :photoable, :polymorphic => true

end
