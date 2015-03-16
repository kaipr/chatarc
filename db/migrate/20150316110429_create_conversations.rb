class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title
      t.text :note
      t.date :occured_on

      t.timestamps null: false
    end
  end
end
