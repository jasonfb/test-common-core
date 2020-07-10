class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|
      t.string :a
      t.integer :b
      t.datetime :c_at

      t.timestamps
    end
  end
end
