require'spec_helper'

describe(Project) do

  describe('#project_title') do
    it('shows the name of a project') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      expect(project.project_title()).to(eq('Dog Walking'))
    end
  end

  describe('#save') do
    it('saves a project to the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      project.save()
      expect(Project.all()).to(eq([project]))
    end
  end

  describe('#id') do
    it('sets a project id to a project upon creation') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      project.save()
      expect(project.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('starts off with an empty array of projects') do
      expect(Project.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same project if it has the same name and id') do
      project1 = Project.new(:project_title => 'Dog Walking', :id => 1
      )
      project2 = Project.new(:project_title => 'Dog Walking', :id => 1
      )
      expect(project1).to(eq(project2))
    end
  end

  describe('.find') do
    it('returns a project by its ID') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      project.save
      project2 = Project.new({:project_title => 'Car Wash', :id => 2
        })
      project2.save
      expect(Project.find(project2.id())).to(eq(project2))
    end
  end

  describe('#update') do
    it('updates the title of a project in the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      project.save()
      project.update({:project_title => 'Dog Washing'})
      expect(project.project_title()).to(eq('Dog Washing'))
    end
  end

  describe('#delete') do
    it('removes a project from the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      project.save()
      project2 = Project.new({:project_title => 'Car Wash', :id => 2
        })
      project2.save()
      project.delete()
      expect(Project.all()).to(eq([project2]))
    end
    it('removes a volunteer from a project in database') do
      project = Project.new({:project_title => 'Dog Walking', :id => 1
        })
      project.save()
      volunteer = Volunteer.new({:volunteer_name => "Maggie", :project_id => 1, :id => 1})
      volunteer.save()
      volunteer2 = Volunteer.new({:volunteer_name => "Yoshi", :project_id => 1, :id => 2})
      volunteer2.save()
      volunteer.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end
end
