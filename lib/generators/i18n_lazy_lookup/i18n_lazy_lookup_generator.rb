class I18nLazyLookupGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :actions, type: :array, banner: "action action", require: true
  class_option :locales, default: %w(en)

  def create_view_files
    create_dirs(controller, actions)
    options[:locales].each do |locale|
      @locale     = locale
      @controller = controller
      @actions    = actions
      template 'locale.erb', File.join(view_path, controller, "#{locale}.yml")
    end
  end

  private
  def create_dirs(controller, actions)
    empty_directory File.join(view_path)
    empty_directory File.join(view_path, controller)
 end

  def view_path
    'config/locales/views'
  end

  def controller
    file_name
  end
end
