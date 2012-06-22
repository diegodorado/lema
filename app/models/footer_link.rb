class FooterLink < ActiveRecord::Base
  validates :location, :presence => true  
  validates :title, :presence => true  
  validates :url, :presence => true  

  def location_enum
    [
      ['1er Columna',:col1],
      ['2da Columna',:col2],
      ['Blog',:blog]
    ]
  end
end

