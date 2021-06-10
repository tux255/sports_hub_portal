class AddColumnPublishedToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column :surveys, :published, :boolean, default: false
  end
end
