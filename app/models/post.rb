class Post < ActiveRecord::Base
  has_many :photos, :as => :photoable
  has_many :pdfs, :as => :pdfable

  validates :section, :presence => true  
  validates :title, :presence => true  
  validates :body, :presence => true  
  validates :published_at, :presence => true  

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :pdfs, :allow_destroy => true

  def section_enum
    [['Agenda', :ag],['Agenda y Trayectoria', :at],['Bitacora', :bt]]
  end

end
