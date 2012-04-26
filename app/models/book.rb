class Book < ActiveRecord::Base

  has_attached_file :cover, :styles => { :medium => "300x430#" }

  # add a delete_<asset_name> method: 
  attr_accessor :delete_cover
  before_validation { self.cover.clear if self.delete_cover == '1' }  

  has_many :photos, :as => :photoable
  has_many :pdfs, :as => :pdfable

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :pdfs, :allow_destroy => true

end
