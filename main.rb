#!/bin/bash/ruby

require 'mysql'

class Main
end

begin
  con = Mysql.connect('localhost', 'root', 'Password1','ShellHistory')
  result = con.query "select * from History"

  result.each_hash do |row|
    puts row
  end

rescue Mysql::Error => e
  puts e
ensure
  con.close if con
end


