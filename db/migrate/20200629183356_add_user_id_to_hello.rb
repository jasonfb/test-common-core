class AddUserIdToHello < ActiveRecord::Migration[6.0]
  def change

    add_column :hellos, :user_id, :integer
  end
end
