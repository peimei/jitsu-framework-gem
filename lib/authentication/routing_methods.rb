Rails::Generator::Commands::Create.class_eval do
  def add_route_info(&block)
    sentinel = 'ActionController::Routing::Routes.draw do |map|'

    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n#{yield}\n"
      end
    end
  end
end
