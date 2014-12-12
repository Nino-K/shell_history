namespace :bash do
  desc "execute all the bash scripts"
  task :init, [:repo] do |t, arg|
    if !arg[:repo].to_s.empty?

      sh "./scripts/git_init.sh #{arg[:repo]}"
      #`./scripts/git_init.sh http://test.com`
    else
      puts "you must pass the git rpo e.g rake fs:create[http://myrepo]"
    end
  end

end