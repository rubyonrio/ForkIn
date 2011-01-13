class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.boolean :done
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
