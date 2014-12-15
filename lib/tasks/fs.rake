require_relative '../../util'
namespace :fs do
  desc "Creating necessary folder structure"
  task :create, [:repo] do |t, arg|

    if !arg[:repo].to_s.empty?
      realHome = Util.new().get_user_home
      puts "creating the required folder structure(#{realHome}/shell_history_src) to back up .bash_history"
      Dir.mkdir("#{realHome}/shell_history_src") unless Dir.exists?("#{realHome}/shell_history_src")

      #call the git scripts here to init
      Rake.application.invoke_task("bash:init[#{arg[:repo]}]")

      # create upstart task
      Rake.application.invoke_task("upstart:create")
    else
      puts "you must pass the git rpo e.g rake fs:create[http://myrepo]"
    end
  end
end


