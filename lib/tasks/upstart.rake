namespace :upstart do
  desc "Create all upstart tasks"
  task :create do
    `sudo cp upstart/shellhistory.conf /etc/init/`
  end
end