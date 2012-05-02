default_run_options[:pty] = true

set :repository,  "git://github.com/diegodorado/lema.git"
set :scm, :git

set :application,  "guillermolema.com.ar"

server "guillermolema.com.ar", :app, :web, :db, :primary => true


set :user, "lema"
set :deploy_to, "/home/lema"
set :deploy_via, :remote_cache
set :scm_verbose, true

set :use_sudo, false


_cset :asset_env, "RAILS_GROUPS=assets"
_cset :assets_prefix, "assets"
_cset :assets_role, [:web]
_cset :normalize_asset_timestamps, false

before 'deploy:finalize_update', 'deploy:assets:symlink'
#after 'deploy:update_code', 'deploy:assets:precompile'

namespace :deploy do
  namespace :assets do
    desc <<-DESC
      [internal] This task will set up a symlink to the shared directory \
      for the assets directory. Assets are shared across deploys to avoid \
      mid-deploy mismatches between old application html asking for assets \
      and getting a 404 file not found error. The assets cache is shared \
      for efficiency. If you cutomize the assets path prefix, override the \
      :assets_prefix variable to match.
    DESC
    task :symlink, :roles => assets_role, :except => { :no_release => true } do
      run <<-CMD
        rm -rf #{latest_release}/public/#{assets_prefix} &&
        mkdir -p #{latest_release}/public &&
        mkdir -p #{shared_path}/assets &&
        ln -s #{shared_path}/assets #{latest_release}/public/#{assets_prefix}
      CMD
    end

    desc <<-DESC
      Run the asset precompilation rake task. You can specify the full path \
      to the rake executable by setting the rake variable. You can also \
      specify additional environment variables to pass to rake via the \
      asset_env variable. The defaults are:

        set :rake,      "rake"
        set :rails_env, "production"
        set :asset_env, "RAILS_GROUPS=assets"
    DESC
    task :precompile, :roles => assets_role, :except => { :no_release => true } do
      run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile"
    end

    desc <<-DESC
      Run the asset clean rake task. Use with caution, this will delete \
      all of your compiled assets. You can specify the full path \
      to the rake executable by setting the rake variable. You can also \
      specify additional environment variables to pass to rake via the \
      asset_env variable. The defaults are:

        set :rake,      "rake"
        set :rails_env, "production"
        set :asset_env, "RAILS_GROUPS=assets"
    DESC
    task :clean, :roles => assets_role, :except => { :no_release => true } do
      run "cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:clean"
    end

    desc <<-DESC
      uploads precompiled assets
    DESC
    task :upload, :roles => assets_role, :except => { :no_release => true } do
      status = system("rsync -avze 'ssh' public/assets/ #{user}@#{application}:#{shared_path}/assets/")
      puts status ? "OK" : "FAILED"
    end
  end
end





# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
