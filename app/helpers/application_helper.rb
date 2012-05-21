module ApplicationHelper

  def body_classes
    [controller.controller_name, controller.action_name]
  end

  def app_js_load(options)
    content_for :app_js_load , "app.load(#{options.to_json});\n".html_safe
  end

  def book_path(book)
    if book.obra?
      obra_show_path(book.id)
    elsif book.ticho?
      ticho_show_path(book.id)
    end
      
  end

end
