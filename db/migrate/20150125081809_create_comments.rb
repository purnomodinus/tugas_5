class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :user
      t.string :content
      t.string :status
      t.references :article, index: true
 
      t.timestamps null: false
      
    end
    add_foreign_key :comments, :articles
  end
end
