class Rails::CommonCoreScaffoldGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)


  def copy_controller_and_spec_files
    object = eval(class_name)
    @columns = object.columns.map(&:name).map(&:to_sym).reject{|x| x==:updated_at || x==:created_at || x==:id}


    @default_colspan = @columns.size
    template "controller.rb", File.join("app/controllers", "#{self.name.downcase}_controller.rb")
  end


  def controller_class_name
    self.name.titlecase
  end


  def singular_name
    super
  end

  def plural_name
    singular_name + "s"
  end

end
