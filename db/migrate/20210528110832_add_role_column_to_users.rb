# frozen_string_literal: true
class AddRoleColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :number
  end
end
