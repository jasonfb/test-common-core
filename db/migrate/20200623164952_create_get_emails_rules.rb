class CreateGetEmailsRules < ActiveRecord::Migration[6.0]
  def change
    create_table :get_emails_rules do |t|
      t.string :abc
      t.string :def
      t.integer :ghi
      t.datetime :something_at
      t.string :something_color

      t.timestamps
    end
  end
end
