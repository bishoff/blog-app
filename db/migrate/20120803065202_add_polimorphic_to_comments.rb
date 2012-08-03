class AddPolimorphicToComments < ActiveRecord::Migration
  def self.up
    drop_table :comments
    
    create_table :comments do |t|
      t.string  :title
      t.text    :comment
      t.integer :user_id
      t.integer :commentable_id
      t.string  :commentable_type

      t.timestamps
    end

    add_index :comments, [:commentable_id, :commentable_type]
  end

  def self.down
    drop_table :comments
    
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
