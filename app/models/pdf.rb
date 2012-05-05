class Pdf < ActiveRecord::Base
  validates :title, :presence => true  
  validates :file, :presence => true  


  #todo: validate content type
  has_attached_file :file
  
  
  belongs_to :pdfable, :polymorphic => true

end
