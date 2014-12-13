require 'yaml'

class Util

  def initialize
    config = YAML.load_file("config/fs_structure.yml")
    @foldername = config['serviceSettings']['tartgetPath']
    @targetFile = config['serviceSettings']['targetFile']
  end

  def get_user_home
    homes = ["HOME", "HOMEPATH"]

    realHome = homes.detect {|h| ENV[h] != nil}

    if not realHome
      pusts "Could not find home dir, you can fix this by creating $HOME variable"
    end

    ENV[realHome]
  end

  def get_target_dir
    "#{get_user_home}/#{@foldername}"
  end

  def get_target_full_path
    "#{get_user_home}/#{@foldername}/#{@targetFile}"
  end
end