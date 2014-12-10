class CreateHistoryTable <  ActiveRecord::Migration

  def up
    execute "create table History(Id int, Body varchar(255));"
  end

  def down
    execute "drop table History;"
  end
end