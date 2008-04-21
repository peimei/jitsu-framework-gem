class ThemeGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      # Generate theme
      m.directory "app/views/layouts/#{file_name}"
      m.template  "layout.html.erb",        "app/views/layouts/#{file_name}.html.haml"
      m.template  "header.html.erb",        "app/views/layouts/#{file_name}/_header.html.haml"
      m.template  "main_menu.html.erb",     "app/views/layouts/#{file_name}/_main_menu.html.haml"
      m.template  "footer.html.erb",        "app/views/layouts/#{file_name}/_footer.html.haml"
      
      m.directory "public/stylesheets/sass"
      m.file      "reset.css.erb",          "public/stylesheets/sass/reset.sass"
      m.file      "theme.css.erb",          "public/stylesheets/sass/theme.sass"
      m.file      "rails.css.erb",          "public/stylesheets/sass/rails.sass"
      m.file      "forms.css.erb",          "public/stylesheets/sass/forms.sass"
    end
  end
end