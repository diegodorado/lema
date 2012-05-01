class Course < ActiveRecord::Base
  belongs_to :category

  has_many :pdfs, :as => :pdfable

  accepts_nested_attributes_for :pdfs, :allow_destroy => true
  

end
