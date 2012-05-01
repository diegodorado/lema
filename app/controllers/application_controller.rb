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
      

        field :title do
          label "Titulo"
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
          include_fields :title, :published_at
          sort_by :published_at
        end
        
        edit do
          include_all_fields
          include_fields :photos
          include_fields :pdfs          
        end
        weight -1


        
      end


      config.model Course do
        label "Curso" 
        label_plural "Cursos"



        field :category do
          label "Categoria"
        end
        field :title do
          label "Titulo"
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

        field :body do
          label "Contenido"
          group :default
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
        label "Libro" 
        label_plural "Libros"
        
        #field :obra_escrita do
        #  pretty_value do
        #    bindings[:object].obra_escrita? ? 'Si.' : 'No.'
        #  end
        #end
        field :section, :enum do
          label 'Seccion'
          group :default
        end

        field :title do
          label "Titulo"
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

        
        group :sidebar do
          label "Extra"
          help "Datos para Obra escrita."
          active false
        end


        group :media do
          label "Media"
          help "Tapa del libro, Imagenes y PDF."
          active false
        end

        edit do
          include_all_fields
          include_fields :photos
          include_fields :pdfs
        end


        list do
          exclude_fields_if do
            true
          end
          include_fields :title, :section
          sort_by :title
        end






      end


      config.model Photo do
        field :title do
          label "Titulo"
        end
        field :image do
          label "Imagen"
        end
        edit do
          field :title
          field :image
        end
      end

      config.model Pdf do
        field :title do
          label "Titulo"
        end
        field :file do
          label "Archivo"
        end

        edit do
          field :title
          field :file
        end
      end

      config.model Category do
        label "Categoria" 
        label_plural "Categorias"
      
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
