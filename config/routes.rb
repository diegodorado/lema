Lema::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => "home#index"
  match '/trayectoria' => 'trayectoria#index'
  match '/obra-escrita' => 'obra#index', :as => :obra
  match '/obra-escrita/:id' => 'obra#show', :as => :obra_show
  match '/agenda' => 'agenda#index'
  match '/bitacora' => 'bitacora#index'
  match '/ticho-ediciones' => 'ticho#index', :as => :ticho
  match '/ticho-ediciones/:id' => 'ticho#show', :as => :ticho_show
  match '/capacitacion' => 'capacitacion#index'
  match '/capacitacion/locale/:locale' => 'capacitacion#locale', :as => :capacitacion_locale
  match '/capacitacion/category/:category_id' => 'capacitacion#category', :as => :capacitacion_category
  match '/capacitacion/course/:id' => 'capacitacion#show', :as => :capacitacion_show


end
