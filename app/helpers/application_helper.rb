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

  def link_to_edit(model)
    klass = model.class.name.downcase
    link_to '(editar)', rails_admin.edit_path(klass, model.id), :class => "admin-edit-link #{klass}-edit-link" if user_signed_in?
  end


end
