#!/usr/bin/env ruby
require_relative 'util'
require_relative 'services/history'

class LogOut

  def initialize
    command = `cat /$HOME/.bash_history`
    @path = Util.new().get_target_full_path
    @history = History.new(command)
  end

  def get_latest_history
    @history.record_history(@path)
  end

end


l = LogOut.new()
l.get_latest_history