class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean

    User.create! do |u|
        u.email     = 'admin@example.com'
        u.password    = 'password'
        u.admin = true
    end
  end
end
