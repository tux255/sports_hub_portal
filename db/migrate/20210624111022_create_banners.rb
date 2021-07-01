# frozen_string_literal: true
class CreateBanners < ActiveRecord::Migration[6.1]
  def change
    create_table :banners do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :closed, null: false, default: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
