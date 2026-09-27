class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
