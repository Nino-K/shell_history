require 'test/unit'
require 'yaml'
require 'securerandom'
require 'mysql'

require_relative '../services/history'
require_relative '../db/adapter'
require_relative '../util'

class RandomTest < Test::Unit::TestCase

  def setup
    @userHome = Util.new().get_target_dir

    config = YAML.load_file("../db/config.yml")
    @server = config['adaptersettings']['server']
    @username =config['adaptersettings']['username']
    @password = config['adaptersettings']['password']
    @db =config['adaptersettings']['database']

    @adapter = Adapter.new(@server,@username, @password, @db)
    @adapter.connect
  end

  def test_completeOperation

    #store get the history and store to the file
    cmd = `cat /$HOME/.bash_history`
    history = History.new(cmd)

    history.record_history("#{@userHome}/history.txt")



    # get the content of the file
    file = File.binread("#{@userHome}/history.txt")
    content = Mysql.escape_string(file)
    fileArray = history.get_history_array(file)

    hash = SecureRandom.hex(fileArray.count)
    mime = history.get_history_file_mime
    @adapter.exec_query("insert into history(hash, mime, content) values('#{hash}', '#{mime}', '#{content}');")
    data = @adapter.exec_query("select * from history order by id desc limit 1;")

    file2 = File.open("#{@userHome}/dbresult.txt", "w")
    data.each_hash do |row|
      file2.write(row['content'])
    end
    file2.close


    # get the current bash_history and compare with the new one from db
    currentHistory = history.get_history_array(File.binread("#{@userHome}/history.txt")).uniq
    recordedHistory = history.get_history_array(File.binread("#{@userHome}/dbresult.txt")).uniq

    newHistory = currentHistory.zip(recordedHistory).flatten.compact
    puts currentHistory.count
    puts recordedHistory.count
    puts newHistory.uniq.count

    puts newHistory.uniq






  end

  def teardown
    @adapter.close?
  end

end