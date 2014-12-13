require 'rspec'
require_relative '../services/history'

describe History do

  before :each do
    @history = History.new()
  end

  context "When user is logging out" do

    it 'it should make a back up of .bash_history in ~/shell_history_src/history.txt' do

      @history.command = `cat /$HOME/.bash_history`
      fileLocation = "#{ENV['HOME']}/shell_history_src/history.txt"

      @history.record_history(fileLocation)

      bashHistory = IO.read("#{ENV['HOME']}/.bash_history")

      bashHistoryBackUp = IO.read("#{ENV['HOME']}/shell_history_src/history.txt")
    
      expect(bashHistory).to eq(bashHistoryBackUp)

    end
  end

end