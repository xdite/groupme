class AddFbIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :fb_id, :string, :limit => 20
    add_column :users, :token, :string
    add_column :users, :name, :string
  end
end
