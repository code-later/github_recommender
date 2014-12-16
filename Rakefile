# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :docker do
  task :build => ['docker:build:web', 'docker:build:app', 'docker:build:worker', 'assets:clobber']

  namespace :build do
    task :web => ['assets:precompile', 'assets:clean'] do
      sh 'ln -snf Dockerfile.web Dockerfile'
      sh 'sudo docker build -t "registry.giantswarm.io/yoshida/gh-recommender-web" .'
      sh 'rm -f Dockerfile'
    end
    
    task :app => ['assets:precompile', 'assets:clean'] do
      sh 'ln -snf Dockerfile.app Dockerfile'
      sh 'sudo docker build -t "registry.giantswarm.io/yoshida/gh-recommender-app" .'
      sh 'rm -f Dockerfile'
    end

    task :worker do
      sh 'ln -snf Dockerfile.worker Dockerfile'
      sh 'sudo docker build -t "registry.giantswarm.io/yoshida/gh-recommender-worker" .'
      sh 'rm -f Dockerfile'
    end
  end
end
