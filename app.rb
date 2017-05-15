require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
also_reload('lib/**/*.rb')
require 'pry'
require 'pg'

DB = PG.connect({:dbname => "volunteer_tracker"})

get '/' do
  @volunteers = Volunteer.all
  @volunteer = Volunteer.find(params['id'].to_i)
  @projects = Project.all
  @project = Project.find(params['id'].to_i)
  erb :index
end

post '/projects' do
  @project = Project.new({:project_title => params['project_title'], :id => nil
    })
  if @project.save
    redirect '/'
  else
    erb(:error)
  end
end

get '/project/:id' do
    @volunteers = Volunteer.all
    @volunteer = Volunteer.find(params['id'].to_i)
    @projects = Project.all
    @project = Project.find(params['id'].to_i)
    erb :project
end

post '/project/:id' do
  @volunteers = Volunteer.all
  @project = Project.find(params['id'].to_i)
  @project.update(:project_title => params['project_title'])
  if @project.update
    redirect "/project/#{@project.id}"
  else
    erb(:error)
  end
end

patch '/project/:id' do
  project_title = params['project_title']
  @project = Project.find(params['id'].to_i)
  @project.update({:project_title => project_title, :id => nil})
  redirect '/'
end

delete '/project/:id' do
  project = Project.find(params['id'].to_i)
  project.delete
  redirect '/'
end


post '/volunteers' do
  volunteer_name = params.fetch("volunteer_name")
  project_id = params.fetch('project_id').to_i
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id, :id => nil})
  if @volunteer.save
    redirect '/'
  else
    erb(:error)
  end
end

get '/volunteer/:id' do
  @volunteers = Volunteer.all
  @volunteer = Volunteer.find(params['id'].to_i)
  @projects = Project.all
  @project = Project.find(params['id'].to_i)
  erb :volunteer
end

post '/volunteer/:id' do
  @vprojects = Project.all
  @volunteer = Volunteer.find(params['id'].to_i)
  @volunteer.update(:volunteer_name => params['volunteer_name'])
  if @volunteer.update
    redirect "/volunteer/#{@volunteer.id}"
  else
    erb(:error)
  end
end

patch '/volunteer/:id' do
  volunteer_name = params['volunteer_name']
  @volunteer = Volunteer.find(params['id'].to_i)
  @volunteer.update({:volunteer_name => volunteer_name, :id => nil})
  redirect '/'
end

delete '/volunteer/:id' do
  volunteer = Volunteer.find(params['id'].to_i)
  volunteer.delete
  redirect '/'
end
