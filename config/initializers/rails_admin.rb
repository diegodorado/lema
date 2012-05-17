require Rails.root.join('lib', 'rails_admin_publish.rb')

module RailsAdmin
  module Config
    module Actions
     class Publish < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
      end
     class NewFromCourse < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
      end
    end
  end
end



RailsAdmin.config do |config|

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    new_from_course
    bulk_delete
    edit
    delete
    publish
  end

end

