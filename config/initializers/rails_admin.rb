# RailsAdmin config file. Generated on March 27, 2012 20:07
# See github.com/sferik/rails_admin for more informations

=begin


require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class MyAction < RailsAdmin::Config::Actions::Base
         RailsAdmin::Config::Actions.register(self)
         register_instance_option :my_option do
           :default_value
         end
      end
    end
  end
end



module RailsAdmin
  module Config
    module Actions
      class Publish < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          false
        end

        register_instance_option :visible? do
          authorized? && (bindings[:controller].main_app.url_for(bindings[:object]) rescue false)
        end

        register_instance_option :controller do
          Proc.new do
            redirect_to main_app.url_for(@object)
          end
        end


        register_instance_option :link_icon do
          'icon-flag'
        end


      end
    end
  end
end

RailsAdmin.config do |config|



      config.actions do
        # root actions
        dashboard                     # mandatory
        # collection actions 
        index                         # mandatory
        new
        bulk_delete

        # member actions
        show
        edit
        delete
        
        
        #        member :publish, RailsAdmin::Config::Actions::Publish

        # use it like this:
          my_action do
            my_option :another_value
          end


          publish

          
      end



end

=end
