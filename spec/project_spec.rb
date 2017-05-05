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



end
