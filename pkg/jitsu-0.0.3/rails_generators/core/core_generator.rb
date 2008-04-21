class CoreGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      File.delete destination_path('/config/routes.rb')
      m.file 'routes.rb', 'config/routes.rb'
      
      File.delete destination_path('/app/controllers/application.rb')
      m.file 'application.rb', 'app/controllers/application.rb'
      
      m.template 'pages_controller.rb', 'app/controllers/pages_controller.rb'
      
      m.directory 'app/views/pages'
      m.file 'index.html.erb', 'app/views/pages/index.html.haml'
      m.file 'about.html.erb', 'app/views/pages/about.html.haml'
      
      m.file 'images/blue_stripes.gif', 'public/images/blue_stripes.gif'
      m.file 'images/buttons_bg.gif', 'public/images/buttons_bg.gif'
      m.file 'images/create_account_btn.gif', 'public/images/create_account_btn.gif'
      m.file 'images/home_icon.gif', 'public/images/home_icon.gif'
      m.file 'images/logo.gif', 'public/images/logo.gif'
      m.file 'images/main_menu_bg.gif', 'public/images/main_menu_bg.gif'
      m.file 'images/menu_tab_bg.gif', 'public/images/menu_tab_bg.gif'
      m.file 'images/menu_tab_left.gif', 'public/images/menu_tab_left.gif'
      m.file 'images/menu_tab_right.gif', 'public/images/menu_tab_right.gif'
      m.file 'images/notice_bg.gif', 'public/images/notice_bg.gif'
      m.file 'images/page_bg.gif', 'public/images/page_bg.gif'
      m.file 'images/railsjitsu_bonsai_black.gif', 'public/images/railsjitsu_bonsai_black.gif'
      m.file 'images/railsjitsu_bonsai_red.gif', 'public/images/railsjitsu_bonsai_red.gif'
      m.file 'images/warning_bg.gif', 'public/images/warning_bg.gif'
    end
  end
end