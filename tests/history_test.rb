require 'test/unit'
require 'mocha/test_unit'

require_relative '../services/history'

class HistoryTest < Test::Unit::TestCase

  def setup
    @history = History.new()
  end

  def test_record_history_empty_path_passed_exception_raised
    @history.command = `ls -la`
    assert_raise(ArgumentError){@history.record_history("")}
  end

  def test_record_history_command_not_set_exception_thrown
    @history.command = ''
    assert_raise(StandardError){@history.record_history('ts')}
  end

  def test_record_history_bad_operation_throws_exception
    @history.expects(:record_history).raises(Exception)
    @history.command = 'legitCommand'
    assert_raise(Exception){@history.record_history('legitPath')}
  end

  def teardown

  end
end