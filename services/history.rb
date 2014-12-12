class History

  attr_accessor :command

  def initialize(cmd = nil)
    @command = cmd
  end

  def record_history(path)
    @path = path
    raise ArgumentError, "file path is required" unless !path.to_s.empty?
    raise StandardError, "you must specify command" unless !command.to_s.empty?
    begin
      file = File.open(path, 'w')
      @command.each_line do |line|
        file.write(line)
      end
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
    ensure
      file.close
    end
  end

  def get_history_array(file)
    fileArray = []
    file.each_line do |l|
      fileArray.push(l)
    end
    fileArray
  end

  def get_history_file_mime
     `file -ib #{@path}`.gsub(/\n/,"")
  end

  def update_bash_history
    # get the current history
    # get the recorded history
    # merge
    # unique
    # update the .bash_history
  end
end