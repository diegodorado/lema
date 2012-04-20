default_run_options[:pty] = true

set :repository,  "git://github.com/diegodorado/lema.git"
set :scm, :git

server "guillermolema.com.ar", :app, :web, :db, :primary => true


set :user, "guillermolema"
set :deploy_to, "/home/guillermolema/guillermolema.com.ar"
set :deploy_via, :remote_cache
set :scm_verbose, true

set :use_sudo, false


namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
