class CreateAuths < ActiveRecord::Migration[6.1]
  def change
    create_table :auths do |t|
      t.integer :user_id
      t.string :uid
      t.string :provider
      t.string :email
      t.string :name
      t.string :image
      t.string :token
      t.integer :expires_at

      t.timestamps
    end
  end
end
