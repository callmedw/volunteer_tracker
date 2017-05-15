require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the index landing page', {:type => :feature} do
  it 'shows title and introduces site navigation' do
    visit '/'
    expect(page).to have_content "Volunteer Hub"
  end
end

describe 'the create, update, and delete a project pathway', {:type => :feature} do
  it 'follows the path from creation to update to deletion of a project' do
    visit '/'
    expect(page).to have_content "Volunteer Hub"
    fill_in('project_title', :with => 'New Project')
    click_button('Add Project')
    expect(page).to have_content "New Project"
    click_link('New Project')
    expect(page).to have_content "Project Management"
    fill_in('project_title', :with => 'Newer Project')
    click_button('Update')
    expect(page).to have_content "Newer Project"
    click_link('Newer Project')
    click_button('Remove Newer Project')
    expect(page).to have_content "Volunteer Hub"
  end
end

describe 'the add a volunteer to a project, update, and delete a volunteer pathway', {:type => :feature} do
  it 'follows the path from creation to update to deletion of a volunteer' do
    visit '/'
    expect(page).to have_content "Volunteer Hub"
    fill_in('project_title', :with => 'New Project')
    click_button('Add Project')
    expect(page).to have_content "New Project"
    select "New Project", :from => "project_id"
    fill_in('volunteer_name', :with => "Someone")
    click_button('Add Volunteer')
    expect(page).to have_content "Someone"
    click_link('Someone')
    expect(page).to have_content "Update Someone"
    fill_in('volunteer_name', :with => 'Newer Volunteer')
    click_button('Update')
    expect(page).to have_content "Newer Volunteer"
    click_link('Newer Volunteer')
    click_button('Remove Newer Volunteer')
    expect(page).to have_content "Volunteer Hub"
  end
end
