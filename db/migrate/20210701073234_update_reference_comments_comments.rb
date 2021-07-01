class UpdateReferenceCommentsComments < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :comments, :comment, column: :parent_comment_id
    add_foreign_key :comments, :comments, column: :parent_comment_id
  end
end
