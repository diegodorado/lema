class Course < ActiveRecord::Base
  belongs_to :category

  has_many :pdfs, :as => :pdfable

  accepts_nested_attributes_for :pdfs, :allow_destroy => true

  def to_post
    post = Post.new
    post.title = "Curso: #{title}"
    post.body = "**Idioma:** #{category.locale_name}  \n**Categoria:** #{category.name}\n\n#{body}"
    post.section = :ag
    post.sidebar_title = "Link al curso"
    post.sidebar_body = "[#{title}](/capacitacion/course/#{id})"
    post
  end  

end
