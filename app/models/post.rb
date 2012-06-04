class Post < ActiveRecord::Base
  has_many :photos, :as => :photoable
  has_many :pdfs, :as => :pdfable

  validates :section, :presence => true  
  validates :title, :presence => true  
  validates :body, :presence => true  
  validates :published_at, :presence => true  

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :pdfs, :allow_destroy => true

  scope :for_year, lambda {|year| where("published_at >= ? and published_at <= ?", "#{year}-01-01", "#{year}-12-31")}

  def section_enum
    [['Agenda', :ag],['Agenda y Trayectoria', :at],['Bitacora', :bt]]
  end

  def video
    v = self['video']
    unless v.match(/youtube/).nil?
      v.sub! /width=\"\d*\"/, 'width="100%"'
      url = v.match(/(src=\")(.*?)(\")/)[2]
      url = url + (url.match(/\?/).nil? ? '?' : '&') + 'wmode=transparent'
      v.sub! /(src=\")(.*?)(\")/, "src=\"#{url}\""
    end
    v
  end


end
