class Pdf < ActiveRecord::Base
  #todo: validate content type
  has_attached_file :file
  belongs_to :pdfable, :polymorphic => true

  # add a delete_<asset_name> method: 
  attr_accessor :delete_file
  before_validation { self.file.clear if self.delete_file == '1' }  
end
