require 'fileutils'

module Jitsu
  class PackageBuilder
    attr_accessor :path
    
    def initialize(path)
      self.path = path
    end
    
    def install_package(package)
      theme = 'default'
      case package
      when 'core'
        puts "[out]\t+core"
        `cd #{path} && ./script/generate core -f`
        `cd #{path} && ./script/generate theme #{theme} -f`
        `haml --rails #{path}`
        `cd #{path} && ./script/plugin install http://rspec.rubyforge.org/svn/tags/CURRENT/rspec`
        `cd #{path} && ./script/plugin install http://rspec.rubyforge.org/svn/tags/CURRENT/rspec_on_rails`

      when 'authentication'
        puts "[out]\t+authentication"
        `cd #{path} && ./script/generate authentication user sessions`
      end
    end
    
    def install_route_info(package)
      puts "[out]\t+#{package}"
      write_to_file get_route(package)
    end
    
    private
    
      def gsub_file(file, regexp, *args, &block)
        content = File.read(file).gsub(regexp, *args, &block)
        File.open(file, 'wb') { |file| file.write(content) }
      end
              
      def write_to_file(routing_text)
        sentinel = 'ActionController::Routing::Routes.draw do |map|'
        gsub_file "#{path}/config/routes.rb", /(#{Regexp.escape(sentinel)})/mi do |match|
          "#{match}\n#{routing_text}"
        end
      end
      
      def replace_marker_in_file(file, marker, text)
        gsub_file file, /(#{Regexp.escape(marker)})/mi do |match|
          text
        end
      end
      
      def read_file
        `cat #{path}/config/routes.rb`
      end
      
      def get_route(package)
        case package
        when 'core'
<<-END
  map.with_options :controller => "pages" do |page|
    page.index '/', :controller => 'pages'
    page.about '/about', :controller => 'pages', :action => 'about'
    page.welcome '/welcome', :controller => 'pages', :action => 'welcome'
  end
  
  map.root :controller => 'pages'
  
END
        when 'authentication'
<<-END
  map.resources :users, :sessions
  
  map.with_options :controller => "users" do |page|
    page.register "/register", :action => "new"
    page.activate "/activate/:activation_code", :action => "activate"
  end

  map.with_options :controller => "sessions" do |page|
    page.login "/login", :action => "new"
    page.logout "/logout", :action => "destroy"
  end
  
END
        end
      end
  end
end