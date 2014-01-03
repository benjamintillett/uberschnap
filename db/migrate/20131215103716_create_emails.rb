class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.string :message
      t.string :email
      t.string :event_type
      t.string :event_location
      t.datetime :date

      t.timestamps
    end
  end
end
