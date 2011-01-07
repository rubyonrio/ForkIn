class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :name
      t.string :login
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :name,                 :unique => true
    add_index :users, :login,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    
    guest = User.create! do |u|
      u.name = 'Admin'
      u.login = 'admin'
      u.email = 'admin@cidadelas.com.br'
      u.password = 'admin123'
      u.password_confirmation = 'admin123'
    end

    # the guest user needs to have id = 0
    sql = "UPDATE users SET id = 0"
    ActiveRecord::Base.connection.execute(sql)
    
    # reset auto increment value to create users with id starting in 1
    sql = "ALTER TABLE users AUTO_INCREMENT = 0"
    ActiveRecord::Base.connection.execute(sql)
  end

  def self.down
    drop_table :users
  end
end
