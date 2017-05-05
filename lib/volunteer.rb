class Volunteer
  attr_reader(:volunteer_name, :project_id)

  define_method(:initialize) do |attributes|
    @volunteer_name = attributes.fetch(:volunteer_name)
    @project_id = attributes.fetch(:project_id)
  end

  define_singleton_method(:all) do
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    returned_volunteers.each do |volunteer|
      volunteer_name = volunteer.fetch('volunteer_name')
      project_id = volunteer.fetch('project_id').to_i
      volunteers.push(Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id}))
    end
    volunteers
  end

  define_method(:add) do
    DB.exec("INSERT INTO volunteers (volunteer_name, project_id) VALUES ('#{@volunteer_name}', #{@project_id});")
  end

  define_method(:==) do |another_volunteer|
    @volunteer_name.==(another_volunteer.volunteer_name)
  end

  define_singleton_method(:find) do |searched_volunteer|
    found_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.volunteer_name == searched_volunteer
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  define_method(:update) do |attributes|
    @volunteer_name = attributes.fetch(:volunteer_name)
    DB.exec("UPDATE volunteers SET volunteer_name = '#{@volunteer_name}' WHERE volunteer_name = '#{self.volunteer_name}' ;")
  end


  define_method(:delete) do
    DB.exec("DELETE FROM projects WHERE id = #{self.project_id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.project_id};")
  end
end
