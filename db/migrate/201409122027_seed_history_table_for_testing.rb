class SeedHistoryTableForTesting  <  ActiveRecord::Migration

  def up
    execute "insert into History values(1, 'content one'), (2, 'content two');"
  end


  def down
    execute "delete from History;"
  end

end