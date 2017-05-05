require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
also_reload('lib/**/*.rb')
require 'pry'
require 'pg'

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  @projects = Project.all()
  erb(:index)
end

post("/projects") do
  project_title = params.fetch("project_title")
  project = Project.new({:project_title => project_title, :id => nil})
  project.save()
  erb(:success)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

patch("/projects/:id") do
  project_title = params.fetch("project_title")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:project_title => project_title})
  erb(:project)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end

post("/volunteers") do
  volunteer_name = params.fetch("volunteer_name")
  project_id = params.fetch('project_id').to_i
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id})
  @volunteer.save()
  erb(:success)
end
