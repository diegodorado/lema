



class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource



  helper RailsAdmin::Engine.helpers

  before_filter :rails_admin_dynamic_config

  def rails_admin_dynamic_config

      model_list = [ Category, User, Book, Post, Pdf, Photo, Course ]

      model_list.each do |m|
          RailsAdmin::Config.reset_model( m )
      end



    RailsAdmin.config do |config|






      config.current_user_method { current_user } # auto-generated
      config.main_app_name = Proc.new { |controller| [ "Guillermo Lema", "Admin - #{controller.params[:action].try(:titleize)}" ] }


      config.excluded_models = [User]


      config.model Post do
      

      
        label "Entrada" 
        label_plural "Entradas"
        #navigation_label 'Entradas, Cursos y Libros'
        weight 0
      
        field :title do
          label "Titulo"
          group :default
        end
        field :section, :enum do
          label 'Seccion'
          group :default
        end
        field :published_at, :date do
          date_format :simple
          label "Publicado el"
          group :default
        end
        field :draft do
          label "Borrador"
          help "No publicar esta entrada."          
          group :default
        end
        field :body do
          label "Contenido"
          group :default
        end

        field :sidebar_title do
          label "Titulo"
          group :sidebar
        end
        field :sidebar_body do
          label "Contenido"
          group :sidebar
        end

        field :photos do
          label "Imagenes"
          group :media
        end
        field :pdfs do
          label "PDFs"
          group :media
        end

        field :audio do
          group :media
        end
        field :video do
          group :media
        end
        
        group :sidebar do
          label "Extra"
          help "barra lateral."
          active false
        end

        group :media do
          label "Media"
          help "Imagenes, Audio, Video y PDF."
          active false
        end


        list do
          exclude_fields_if do
            true
          end
          include_fields :title, :draft, :section, :published_at
          sort_by :published_at
        end

        edit do
          include_all_fields
        end

      end


      config.model Course do
        weight 1
        label "Curso" 
        label_plural "Cursos"

        field :title do
          label "Titulo"
        end
        field :category do
          label "Categoria"
        end
        field :body do
          label "Contenido"
          group :default
        end


        field :specification do
          label "Ficha"
          group :extra
        end
        field :objective do
          label "Objetivo"
          group :extra
        end
        field :summary do
          label "Contenido"
          group :extra
        end


        field :pdfs do
          label "PDFs"
          group :media
        end
        
        group :extra do
          label "Extra"
          help "Ficha, Objetivo y Contenido."
          active false
        end


        group :media do
          label "Media"
          help "PDFs."
          active false
        end

        list do
          exclude_fields_if do
            true
          end
          include_fields :title, :category
          sort_by :title
        end

        edit do
          field :category do
            partial "form_category_select"
          end
          include_all_fields
        end
        
      end

      config.model Book do
        weight 2
      
        label "Libro" 
        label_plural "Libros"
        
        field :title do
          label "Titulo"
          group :default
        end

        field :section, :enum do
          label 'Seccion'
          group :default
        end


        field :specification do
          label "Especificaciones"
          group :default
        end

        field :body do
          label "Contenido"
          group :default
        end

        field :photos do
          label "Imagenes"
          group :media
        end
        field :pdfs do
          label "PDFs"
          group :media
        end
        field :cover do
          label "Tapa del libro"
          group :media
        end


        field :points_of_sale do
          label "Puntos de Venta"
          group :sidebar
        end
        field :buy_online do
          label "Comprar Online"
          group :sidebar
        end

        
        group :media do
          label "Media"
          help "Tapa del libro, Imagenes y PDF."
          active false
        end

        group :sidebar do
          label "Extra"
          help "Datos para Obra escrita."
          active false
        end

        list do
          exclude_fields_if do
            true
          end
          include_fields :title, :section
          sort_by :title
        end

        edit do
          include_all_fields
        end


      end


      config.model Photo do
        weight 4
      
        label "Foto" 
        label_plural "Fotos"
        field :image do
          label "Imagen"
        end
        field :photoable do
          label "Registro Relacionado"
          #pretty_value do
          #  bindings[:object].photoable.title if bindings[:object].photoable
          #end
        end
        list do
          include_fields :image, :photoable
        end
        edit do
          exclude_fields_if do
            true
          end        
          include_fields :image
        end
      end

      config.model Pdf do
        weight 3
      
        field :title do
          label "Titulo"
        end
        field :file do
          label "Archivo"
        end
        field :pdfable do
          label "Registro Relacionado"
        end

        list do
          include_fields :title, :pdfable
        end

        edit do
          exclude_fields_if do
            true
          end        
          field :title
          field :file
        end
      end

      config.model Category do
        label "Categoria" 
        label_plural "Categorias"
        
        parent Course
        
        field :locale, :enum do
          label "Idioma"
        end
        field :name do
          label "Nombre"
        end


        object_label_method do
          :full_name
        end


      end


    end

  end




  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
  
end
