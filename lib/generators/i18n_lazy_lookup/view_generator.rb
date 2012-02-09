module I18nLazyLookup
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)
      argument :controller, :type => :string, :banner => "controller",    :require => true
      argument :actions,    :type => :array,  :banner => "action action", :require => true

      def create_view_files
        create_dirs(controller, actions)
        file_name.split(" ").each do |locale|
          actions.each do |action|
            @locale     = locale
            @controller = controller
            @actions    = actions
            template 'locale.erb', File.join(view_path, controller, action, "#{locale}.yml")
          end
        end
      end

      private
        def create_dirs(controller, actions)
          empty_directory File.join(view_path)
          empty_directory File.join(view_path, controller)
          actions.each do |action|
            empty_directory File.join(view_path, controller, action)
          end
        end

        def view_path
          'config/locales/views'
        end
    end
  end
end
