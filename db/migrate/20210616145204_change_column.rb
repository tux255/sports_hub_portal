class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :categories, :title, :string, unique: true
  end
end
