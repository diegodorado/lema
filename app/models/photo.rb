class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "540x300>", :thumb => "100x100#" }
  belongs_to :photoable, :polymorphic => true
end
