class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :email
      t.string :user_name
      t.string :password_digest
      t.integer :role
      t.timestamps
    end
  end
end
