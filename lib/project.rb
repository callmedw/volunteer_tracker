class Project
  attr_reader(:project_title)

  define_method(:initialize) do |attributes|
    @project_title = attributes.fetch(:project_title)
  end

end
