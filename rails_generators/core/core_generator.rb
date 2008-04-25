class CoreGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'routes.rb', 'config/routes.rb'
      m.file 'application.rb', 'app/controllers/application.rb'      
      m.file 'application_helper.rb', 'app/helpers/application_helper.rb'
      
      m.template 'pages_controller.rb', 'app/controllers/pages_controller.rb'
      
      m.directory 'app/views/pages'
      m.file 'index.html.erb', 'app/views/pages/index.html.haml'
      m.file 'about.html.erb', 'app/views/pages/about.html.haml'
    end
  end
end