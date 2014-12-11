require 'test/unit'
require 'mocha/test_unit'
require 'yaml'

require_relative '../db/adapter'

class AdapterTest < Test::Unit::TestCase
  def setup
    config = YAML.load_file("../db/config.yml")
    @server = config['adaptersettings']['server']
    @username =config['adaptersettings']['username']
    @password = config['adaptersettings']['password']
    @db =config['adaptersettings']['database']

    @Adapter = Adapter.new(@server,@username, @password, @db)
  end

  def test_Simple
    @Adapter.connect
    data = @Adapter.exec_query("select * from history;")

    data.each_hash do |row|
      puts row
    end

  end

  def teardown

  end

end