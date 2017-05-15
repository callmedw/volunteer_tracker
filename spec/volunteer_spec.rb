require'spec_helper'

describe(Volunteer) do

  describe('.all') do
    it('is empty at first') do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a volunteer to the database') do
      volunteer = Volunteer.new({:volunteer_name => "Yoshi", :project_id => 1, :id => 1})
      volunteer.save()
      expect(Volunteer.all()).to(eq([volunteer]))
    end
  end

  describe('#volunteer_name') do
    it('shows the name of a volunteer') do
      volunteer = Volunteer.new({:volunteer_name => "Yoshi", :project_id => 1, :id => 2})
      expect(volunteer.volunteer_name()).to(eq('Yoshi'))
    end
  end

  describe('#==') do
    it('is the same volunteer if it has the same name') do
      volunteer1 = Volunteer.new({:volunteer_name => "Maggie", :project_id => 1, :id => 1})
      volunteer2 = Volunteer.new({:volunteer_name => "Maggie", :project_id => 1, :id => 1})
      expect(volunteer1).to(eq(volunteer2))
    end
  end

  describe('.find') do
    it('returns a volunteer by their id') do
      volunteer = Volunteer.new({:volunteer_name => "Maggie", :project_id => 1, :id => 1})
      volunteer.save
      volunteer2 = Volunteer.new({:volunteer_name => "Yoshi", :project_id => 1, :id => 2})
      volunteer2.save
      expect(Volunteer.find(volunteer2.id())).to(eq(volunteer2))
    end
  end

  describe('#update') do
    it('updates the name of a volunteer in the database') do
      volunteer = Volunteer.new({:volunteer_name => "Maggie", :project_id => 1, :id => 2})
      volunteer.save
      volunteer.update({:volunteer_name => 'Yoshi'})
      expect(volunteer.volunteer_name()).to(eq('Yoshi'))
    end
  end

  describe('#delete') do
    it('removes a volunteer from the database') do
      volunteer = Volunteer.new({:volunteer_name => "Maggie", :project_id => 2, :id => 1})
      volunteer.save()
      volunteer2 = Volunteer.new({:volunteer_name => "Yoshi", :project_id => 1, :id => 2})
      volunteer2.save()
      volunteer.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end
end
