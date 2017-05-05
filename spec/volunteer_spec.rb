require'spec_helper'

describe(Volunteer) do

  describe('.all') do
    it('is empty at first') do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#add') do
    it('adds a volunteer to the database') do
      project = Project.new({:project_title => 'Dog Walking', :id => nil
        })
      project.add()
      volunteer = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      volunteer.add()
      expect(Volunteer.all()).to(eq([volunteer]))
    end
  end

  describe('#volunteer_name') do
    it('shows the volunteer_name of a volunteer') do
      volunteer = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      expect(volunteer.volunteer_name()).to(eq('Yoshi'))
    end
  end

  describe('#==') do
    it('is the same volunteer if it has the same name') do
      volunteer1 = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      volunteer2 = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      expect(volunteer1).to(eq(volunteer2))
    end
  end

  describe('.find') do
    it('returns a volunteer by their name') do
      volunteer = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      volunteer.add
      volunteer2 = Volunteer.new({:volunteer_name => 'Maggie', :project_id => 2})
      volunteer2.add
      expect(Volunteer.find(volunteer2.volunteer_name())).to(eq(volunteer2))
    end
  end

  describe('#update') do
    it('updates the name of a volunteer in the database') do
      volunteer = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      volunteer.add
      volunteer.update({:volunteer_name => 'Maggie'})
      expect(volunteer.volunteer_name()).to(eq('Maggie'))
    end
  end

  describe('#delete') do
    it('removes a volunteer from the database') do
      volunteer = Volunteer.new({:volunteer_name => 'Yoshi', :project_id => 1})
      volunteer.add()
      volunteer2 = Volunteer.new({:volunteer_name => 'Maggie', :project_id => 2})
      volunteer2.add()
      volunteer.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end
end
