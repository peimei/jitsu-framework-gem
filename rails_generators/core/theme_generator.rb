class ThemeGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      # Generate theme
      dir = "app/views/layouts/#{file_name}"
      m.directory dir
      m.template  "layout.html.erb",        "#{dir}.html.haml"
      m.template  "header.html.erb",        "#{dir}/_header.html.haml"
      m.template  "top_menu.html.erb",     "#{dir}/_top_menu.html.haml"
      m.template  "main_menu.html.erb",     "#{dir}/_main_menu.html.haml"
      m.template  "footer.html.erb",        "#{dir}/_footer.html.haml"
      
      dir = "app/views/stylesheets"
      m.directory dir
      m.template      "reset.css.erb",          "#{dir}/reset.sass"
      m.template      "theme.css.erb",          "#{dir}/theme.sass"
      m.template      "rails.css.erb",          "#{dir}/rails.sass"
      m.template      "forms.css.erb",          "#{dir}/forms.sass"
      m.template      "pages.css.erb",          "#{dir}/pages.sass"
      
      # Add our Authentication system hook via an initializer
      m.file 'sass_initializer.rb', 'config/initializers/sass_hook.rb'
      
      new_path, old_path = "public/images/#{file_name}", 'images'
      m.directory new_path
      m.file "#{old_path}/blue_stripes.gif", "#{new_path}/blue_stripes.gif"
      m.file "#{old_path}/featured_bg.gif", "#{new_path}/featured_bg.gif"
      m.file "#{old_path}/feature_box_bg.gif", "#{new_path}/feature_box_bg.gif"
      m.file "#{old_path}/buttons_bg.gif", "#{new_path}/buttons_bg.gif"
      m.file "#{old_path}/create_account_btn.gif", "#{new_path}/create_account_btn.gif"
      m.file "#{old_path}/home_icon.gif", "#{new_path}/home_icon.gif"
      m.file "#{old_path}/logo.gif", "#{new_path}/logo.gif"
      m.file "#{old_path}/notice_bg.gif", "#{new_path}/notice_bg.gif"
      m.file "#{old_path}/page_bg.gif", "#{new_path}/page_bg.gif"
      m.file "#{old_path}/railsjitsu_bonsai_black.gif", "#{new_path}/railsjitsu_bonsai_black.gif"
      m.file "#{old_path}/railsjitsu_bonsai_red.gif", "#{new_path}/railsjitsu_bonsai_red.gif"
      m.file "#{old_path}/top_menu_bg.gif", "#{new_path}/top_menu_bg.gif"
      m.file "#{old_path}/warning_bg.gif", "#{new_path}/warning_bg.gif"
    end
  end
end