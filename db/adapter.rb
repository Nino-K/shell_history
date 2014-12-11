require 'active_record'

class Adapter

  # do we need to expose these, for testing??
  attr_accessor :server, :username, :password, :database


  def initialize(srv, uname, passwd, db)
    @server = srv
    @username = uname
    @password = passwd
    @database = db
  end

  def connect
    begin
      @connection = ActiveRecord::Base.establish_connection(
          :adapter => 'mysql',
          :host => @server,
          :database => @database,
          :username => @username,
          :password => @password
      )
    rescue Exception => e
      puts e
      puts e.backtrace.inspect
    end
    @connection
  end

  def exec_query(query)
    raise ArgumentError, "query can not be empty" unless !query.to_s.empty?
    begin
      result = @connection.connection.execute(query)
    rescue Exception => e
      puts e
      puts e.backtrace.inspect
    end
    result
  end

  def close?
    begin
      ActiveRecord::Base.connection.close
    rescue Exception => e
      puts e
      puts e.backtrace.inspect
    ensure
      ActiveRecord::Base.clear_active_connections!
    end
    ActiveRecord::Base.connected?
  end
end