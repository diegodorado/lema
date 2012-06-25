module ApplicationHelper

  def body_classes
    [controller.controller_name, controller.action_name]
  end

  def app_js_load(options)
    content_for :app_js_load , "app.load(#{options.to_json});\n".html_safe
  end


  #todo: make single post view
  # and lead to proper routes
  def posts_url
    trayectoria_url
  end
  def post_url(post)
    trayectoria_url
  end

  def content_box
    haml_tag :div, :class => "holder" do
      haml_tag :div, :class => "top"
      haml_tag :div, :class => "content" do
        yield
      end
      haml_tag :div, :class => "bottom"
    end
  end
  

  def arrow_link(text, path, klass)
    link_to path, :class => "arrow-link #{klass}" do
      haml_tag :i
      haml_tag :span, text
      yield if block_given?
    end
  end
  

  def book_path(book)
    if book.obra?
      obra_show_path(book.id)
    elsif book.ticho?
      ticho_show_path(book.id)
    end
  end

  def link_to_edit(model)
    klass = model.class.name.downcase
    link_to '(editar)', rails_admin.edit_path(klass, model.id), :class => "admin-edit-link #{klass}-edit-link" if user_signed_in?
  end


end
