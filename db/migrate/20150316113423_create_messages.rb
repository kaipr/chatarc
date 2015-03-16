class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, index: true
      t.references :channel, index: true
      t.references :participant, index: true
      t.text :content
      t.date :sent_on
      t.time :sent_at

      t.timestamps null: false
    end
    add_foreign_key :messages, :conversations
    add_foreign_key :messages, :channels
    add_foreign_key :messages, :participants
  end
end
