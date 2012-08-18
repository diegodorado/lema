class Book < ActiveRecord::Base

  validates :section, :presence => true  
  validates :title, :presence => true  
  validates :body, :presence => true  
  validates :published_at, :presence => true 

  has_attached_file :cover, {
      :styles => { :medium => "222x344#", :thumb => "100x100#" }
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
