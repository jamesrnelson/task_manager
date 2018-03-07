require_relative '../models/task.rb'

# Defines Task Manager App
class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path('..', __dir__)

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = %w[task1 task2 task3]
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task = Task.new(params[:task])
    task.save
    redirect '/tasks'
  end
end
