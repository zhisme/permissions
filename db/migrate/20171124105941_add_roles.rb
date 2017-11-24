class AddRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
    add_index :roles, :name, unique: true

    create_table :permissions_roles do |t|
      t.integer :role_id, index: true
      t.integer :permission_id, index: true
    end
  end
end
