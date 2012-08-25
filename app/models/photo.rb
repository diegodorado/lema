class Photo < ActiveRecord::Base
  validates :image, :attachment_presence => true

  has_attached_file :image, {
      :styles => { :original => "764x", :thumb => "100x100#" } 
    }

  belongs_to :photoable, :polymorphic => true

end
