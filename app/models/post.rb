class Post < ActiveRecord::Base
  has_many :photos, :as => :photoable
  has_many :pdfs, :as => :pdfable

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :pdfs, :allow_destroy => true
  
end
