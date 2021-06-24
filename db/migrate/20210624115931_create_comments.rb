class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.references :parent_comment, null: false, foreign_key: { to_table: :comment }
      t.text :body

      t.timestamps
    end
  end
end
