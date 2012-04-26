class Photo < ActiveRecord::Base
  has_attached_file :image, {
      :styles => { :medium => "540x300>", :thumb => "100x100#" },
      :storage => :s3, 
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :path => "/photos/:style/:id/:filename" 
    }

  belongs_to :photoable, :polymorphic => true

  # add a delete_<asset_name> method: 
  attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }  
end
