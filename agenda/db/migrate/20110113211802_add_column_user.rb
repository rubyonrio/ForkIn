class AddColumnUser < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar_url, :string
    add_index :users, :avatar_url
  end

  def self.down
    remove_index :users, :avatar_url
    remove_column :users, :avatar_url
  end
end
