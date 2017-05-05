require'spec_helper'

describe(Project) do

  describe('#project_title') do
    it('shows the name of a project') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      expect(project.project_title()).to(eq('Dog Walking'))
    end
  end

  describe('#add') do
    it('adds a project to the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add()
      expect(Project.all()).to(eq([project]))
    end
  end

  describe('#id') do
    it('sets a project id to a project upon creation') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add()
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
      project1 = Project.new(:project_title => 'Dog Walking', :id => nil)
      project2 = Project.new(:project_title => 'Dog Walking', :id => nil)
      expect(project1).to(eq(project2))
    end
  end

  describe('.find') do
    it('returns a project by its ID') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add
      project2 = Project.new({:project_title => 'Car Wash', :id => nil})
      project2.add
      expect(Project.find(project2.id())).to(eq(project2))
    end
  end

  describe('#update') do
    it('updates the title of a project in the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add()
      project.update({:project_title => 'Dog Washing'})
      expect(project.project_title()).to(eq('Dog Washing'))
    end
  end

  describe('#delete') do
    it('removes a project from the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add()
      project2 = Project.new({:project_title => 'Car Wash', :id => nil})
      project2.add()
      project.delete()
      expect(Project.all()).to(eq([project2]))
    end
    it('removes a volunteer from a project in database') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add()
      volunteer = Volunteer.new({:name => 'Yoshi', :project_id => project.id()})
      volunteer.add()
      volunteer2 = Volunteer.new({:name => 'Maggie', :project_id => project.id()})
      volunteer2.add()
      project.delete()
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#volunteers') do
    it('returns an array of volunteers for that project') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      project.add()
      volunteer = Volunteer.new({:name => 'Yoshi', :project_id => project.id()})
      volunteer.add()
      volunteer2 = Volunteer.new({:name => 'Maggie', :project_id => project.id()})
      volunteer2.add()
      expect(project.volunteers(project.id())).to(eq([volunteer, volunteer2]))
    end
  end
end
