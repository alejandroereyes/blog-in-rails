class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: "Blog Title"
      t.text   :body, null: false, default: "Blog You Heart Out"
      t.timestamps null: false
    end
  end
end
