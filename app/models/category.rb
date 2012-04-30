class Category < ActiveRecord::Base
  has_many :courses
  validates :locale, :presence => true  
  validates :name, :presence => true  


  def self.by_locale
    Hash[
      self.locales.map do |l| 
        [(I18n.t 'language_name', :locale => l), where(:locale => l).order(:name).map { |c| [c.name,c.id] } ]
      end
    ]
  end

  
  def self.locales
    [:es, :en, :cs, :it, :fr]
  end
  
  def locale_enum
    Category.locales.map{ |l| [(I18n.t 'language_name', :locale => l),l]}
  end


  def full_name
    "#{I18n.t 'language_name', :locale => self.locale} - #{self.name}"
  end
  
end

