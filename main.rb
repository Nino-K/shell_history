#!/bin/bash/ruby

require 'mysql'
require 'yaml'
require 'active_record'

require_relative 'services/history'
require_relative 'db/adapter'


command = `cat /$HOME/.bash_history`

hs = History.new()
hs.command = command
hs.record_history("src/history.txt")



config = YAML.load_file("db/config.yml")
puts config['adaptersettings']['username']

adapter = Adapter.new(config['adaptersettings']['server'],config['adaptersettings']['username'], config['adaptersettings']['password'],config['adaptersettings']['database'])


adapter.connect
adapter.exec_query("insert into history(hash, mime, content) values('asdDDDDDDDDDDDDDDDDDDDDDDDDDf', 'gDDDDDDDDDDDDDDDDDDDDDDDDDDDfh', 'werDDDDDDDDDDDDDDDDDDDDDDDDDDt');")



data = adapter.exec_query("select * from history;")
data.each_hash do |t|
  puts t['hash']
end

puts adapter.close?

=begin
begin
  con = Mysql.connect('localhost', 'root', 'Password1','ShellHistory')

  path = "src/history.txt"
  mimetype = `file -ib #{path}`.gsub(/\n/,"")

  f = File.binread("src/history.txt")
  data = con.escape_string(f)

  hash = "test"

  con.query("insert into history(hash, mime, content) values('#{hash}', '#{mimetype}', '#{data}');")
  result = con.query "select * from history;"

  newFile = File.open("src/test.txt", "w")

  result.each_hash do |row|
    puts row
    newFile.write(row['content'])
  end

rescue Mysql::Error => e
  puts e
ensure
  con.close if con
end
=end



