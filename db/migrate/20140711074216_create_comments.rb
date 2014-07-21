class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :commenter_id
      t.integer :rating
      t.timestamps
    end
  end
end
