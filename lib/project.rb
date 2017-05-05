class Project
  attr_reader(:project_title, :id)

  define_method(:initialize) do |attributes|
    @project_title = attributes.fetch(:project_title)
    @id = attributes.fetch(:id)
  end

  define_method(:add) do
    result = DB.exec("INSERT INTO projects (project_title) VALUES ('#{@project_title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      project_title = project.fetch("project_title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:project_title => project_title, :id => id}))
    end
    projects
  end

  define_method(:==) do |another_project|
    self.project_title().==(another_project.project_title()).&(self.id().==(another_project.id()))
  end

  define_singleton_method(:find) do |id|
    found_project = nil
    Project.all().each() do |project|
      if project.id() == id
        found_project = project
      end
    end
    found_project
  end

end
