class AddUserSectionIndex < ActiveRecord::Migration
  def change
    add_index :sections, :user_id
  end
end
