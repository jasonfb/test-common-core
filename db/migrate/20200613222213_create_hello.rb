class CreateHello < ActiveRecord::Migration[6.0]
  def change
    create_table :hellos do |t|

      t.integer :age
      t.string :name
      t.text :text, limit: 700000
      t.integer :gender_id
      t.timestamps
    end
  end
end
