class History

  attr_accessor :command

  def record_history(path)
    raise ArgumentError, "file path is required" unless !path.to_s.empty?
    raise StandardError, "you must specify command" unless !command.to_s.empty?
    begin
      file = File.open(path, 'w')
      command.each_line do |line|
        file.write(line)
      end
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
    ensure
      file.close
    end
  end

  def update_bash_history
    # todo: run the bash script to update the .bash_history
  end
end