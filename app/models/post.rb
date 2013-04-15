class Post < ActiveRecord::Base
  has_many :photos, :as => :photoable
  has_many :pdfs, :as => :pdfable

  validates :section, :presence => true  
  validates :title, :presence => true  
  validates :body, :presence => true  
  validates :published_at, :presence => true  

  validate :validate_audio_iframe
  validate :validate_video_iframe

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :pdfs, :allow_destroy => true

  scope :for_year, lambda {|year| where("published_at >= ? and published_at <= ?", "#{year}-01-01", "#{year}-12-31")}

  def section_enum
    [['Agenda', :ag],['Agenda y Trayectoria', :at],['Bitacora', :bt]]
  end

  def playlist?
    audio.include? 'playlists'
  end


  private
  
  #return an iframe or nil
  def validate_iframe(attribute)
    
    html = self[attribute]
    fragment = Nokogiri::HTML::DocumentFragment.parse(self[attribute])
    iframe = fragment.children[0]
    return if iframe.nil?
    if iframe.name != 'iframe'
      self.errors.add attribute, "Invalid Embed Code (must be an iframe)" 
      return nil
    end
    iframe.attributes['width'].value = '100%'
    iframe.attributes['frameborder'].value = '0'
    iframe
  end
  
  def validate_audio_iframe
    iframe = validate_iframe(:audio)
    return if iframe.nil?
    
    src = iframe.attributes['src'].value
    
    return self.errors.add :audio, "Only soundcloud is allowed" unless src.include? 'soundcloud'

    if src.include? 'playlists'
      iframe.attributes['height'].value = '450'
    else
      iframe.attributes['height'].value = '166'
    end
    
    self.audio = iframe.to_html
  end

  def validate_video_iframe
    iframe = validate_iframe(:video)
    return if iframe.nil?
    
    iframe.attributes['height'].value = '315'

    src = iframe.attributes['src'].value

    return self.errors.add :video, "Only youtube or vimeo are allowed" if src.match('youtube|vimeo').nil?

    iframe.attributes['src'].value = src.sub(/(youtube[^\?]*)(.*)/,'\1?wmode=transparent')

    #if src.include? 'youtube'
    #  iframe.attributes['src'].value = src.sub(/$|\?.*/,'?wmode=transparent')
    #end

    self.video = iframe.to_html

  end


end
