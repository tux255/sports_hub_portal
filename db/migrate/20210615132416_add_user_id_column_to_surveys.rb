class AddUserIdColumnToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :user_id, :number, null: false, default: 1
  end
end
