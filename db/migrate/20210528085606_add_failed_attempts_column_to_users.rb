# frozen_string_literal: true
class AddFailedAttemptsColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :failed_attempts, :number
  end
end
