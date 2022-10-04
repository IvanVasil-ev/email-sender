class AddUserModel < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.boolean :is_confirmed, null: false, default: false
      t.timestamp :confirmed_at
      t.inet :ip

      t.timestamps
    end
  end
end
