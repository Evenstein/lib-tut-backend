class CreateRefreshTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :refresh_tokens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token
      t.string :device_uid
      t.datetime :expires_at

      t.timestamps
    end
  end
end
