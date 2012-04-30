class Book < ActiveRecord::Base

  validates :section, :presence => true  
  validates :title, :presence => true  
  validates :body, :presence => true  


  has_attached_file :cover, {
      :styles => { :medium => "300x430#" },
      :storage => :s3, 
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :path => "/book_covers/:style/:id/:filename" 
    }


  # add a delete_<asset_name> method: 
  attr_accessor :delete_cover
  before_validation { self.cover.clear if self.delete_cover == '1' }  

  has_many :photos, :as => :photoable
  has_many :pdfs, :as => :pdfable

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :pdfs, :allow_destroy => true

  def section_enum
    [['Obra Escrita', :oe],['Ticho Ediciones', :te]]
  end
  
  def ticho?
    section == 'te'
  end

  def obra?
    section == 'oe'
  end


end
