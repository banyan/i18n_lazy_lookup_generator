require 'find'

module I18nLazyLookup
  module Generators
    class GenerateGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      class_option :locales, default: %w(en)
      class_option :exclude_patterns, default: %w(layouts shared).join('|')

      def manifest
        empty_directory File.join(view_path)

        controller_action_map = {}
        Find.find(File.join('app/views')) do |path|
          if path =~ /app\/views\/?(.*)?\/(.*)\/(.*)\.html\.[erb|haml]/
            namespace, controller, action  = $1, $2, $3
            next if action =~ /^_/
            next if controller =~ /#{options[:exclude_patterns]}/
            if controller_action_map.key?(controller)
              controller_action_map[controller] << action
            else
              controller_action_map[controller] = [action]
            end
          end
        end

        controller_action_map.each do |controller, actions|
          create_dirs(controller, actions)
          options[:locales].each do |locale|
            @locale     = locale
            @controller = controller
            @actions    = actions
            template 'locale.erb', File.join(view_path, controller, "#{locale}.yml")
          end
        end
      end

      private
      def create_dirs(controller, actions)
        empty_directory File.join(view_path, controller)
      end

      def view_path
        'config/locales/views'
      end
    end
  end
end
