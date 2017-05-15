class Project
  attr_reader(:project_title, :id)

  define_method(:initialize) do |attributes|
    @project_title = attributes.fetch(:project_title)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |another_project|
    self.project_title().==(another_project.project_title()).&(self.id().==(another_project.id()))
  end

  define_method(:save) do
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

  define_singleton_method(:find) do |id|
    found_project = nil
    Project.all().each() do |project|
      if project.id() == id
        found_project = project
      end
    end
    found_project
  end

  define_method(:update) do |attributes|
    @project_title = attributes.fetch(:project_title)
    @id = self.id()
    DB.exec("UPDATE projects SET project_title = '#{@project_title}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id};")
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
  end



  define_method(:volunteers) do
  matching_volunteers = []
  @id = self.id
  volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
   volunteers.each do |volunteer|
    matching_volunteers.push(volunteer)
  end
  matching_volunteers
end

  define_method(:volunteers) do
    project_volunteers = []
    results = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
    results.each do |result|
      name = result.fetch('volunteer_name')
      project_id = result.fetch('project_id').to_i
      id = result.fetch('id').to_i
      project_volunteers.push(Volunteer.new({:volunteer_name => name, :project_id => project_id, :id => id}))
    end
    project_volunteers
  end
end
