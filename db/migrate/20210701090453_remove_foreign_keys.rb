class RemoveForeignKeys < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key 'posts', 'users'
    remove_foreign_key 'surveys', 'users'
  end
end
