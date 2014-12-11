class CreateHistoryTable <  ActiveRecord::Migration

  def up
    #execute "create table History(id int NOT NULL AUTO_INCREMENT, hash varchar(255),mime varchar(255) NOT NULL ,data blob NOT NULL, PRIMARY KEY(id));"
    create_table :history do |t|
      t.string :hash, null: false, :limit => 255
      t.string :mime, null: false, :limit => 255
      t.binary :content, null: false, :limit => 10.megabyte

    end
  end

  def down
    #execute "drop table History;"
    drop_table :history
  end
end