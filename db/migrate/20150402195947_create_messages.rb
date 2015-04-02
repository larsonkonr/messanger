class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text     :body
      t.integer  :conversation_id
      t.integer  :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :messages, :conversation_id
    add_index :messages, :user_id
  end
end
