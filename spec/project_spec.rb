require'spec_helper'

describe(Project) do

  describe('#project_title') do
    it('shows the name of a project') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil})
      expect(project.project_title()).to(eq('Dog Walking'))
    end
  end


end
