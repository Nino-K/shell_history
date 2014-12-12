class Util
  def get_user_home
    homes = ["HOME", "HOMEPATH"]

    realHome = homes.detect {|h| ENV[h] != nil}

    if not realHome
      pusts "Could not find home dir, you can fix this by creating $HOME variable"
    end

    ENV[realHome]
  end

  def get_target_dir
    "#{get_user_home}/shell_history_src"
  end
end