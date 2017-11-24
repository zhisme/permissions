class CreateUsersPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :email, unique: true
      t.timestamps
    end

    create_table :permissions do |t|
      t.string :action, index: true
      t.boolean :value
      t.timestamps
    end
    add_index :permissions, %i[action value], unique: true

    create_table :users_permissions do |t|
      t.integer :user_id, index: true
      t.integer :permission_id, index: true
    end
  end
end
