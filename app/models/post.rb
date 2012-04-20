class Post < ActiveRecord::Base
  has_many :photos, :as => :photoable
  has_many :postlinks

  accepts_nested_attributes_for :postlinks, :allow_destroy => true
  attr_accessible :postlinks_attributes, :allow_destroy => true

  
end
