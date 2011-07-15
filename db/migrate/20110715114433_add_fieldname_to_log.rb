class AddFieldnameToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :user_id, :integer
  end

  def self.down
    remove_column :logs, :user_id
  end
end
