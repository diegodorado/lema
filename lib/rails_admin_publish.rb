require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class Publish < RailsAdmin::Config::Actions::Base
      	# There are several options that you can set here. Check https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb for more info.

        register_instance_option :link_icon do
          'icon-share'
        end

        register_instance_option :member? do
          true
        end

        register_instance_option :visible? do
          bindings[:abstract_model].model.to_s == "Course"
        end
        
		    register_instance_option :controller do
		      Proc.new do
		        redirect_to rails_admin.new_from_course_path('post', {:course_id =>@object.id})
		      end
		    end
      end

      class NewFromCourse < RailsAdmin::Config::Actions::Base
        register_instance_option :collection? do
          true
        end
        
        register_instance_option :visible? do
          false
        end
        
		    register_instance_option :controller do
		      Proc.new do
            course = Course.find(params[:course_id])
            @object = course.to_post
		        render :action => 'new'
		      end
		    end
      end
      
    end
  end
end
