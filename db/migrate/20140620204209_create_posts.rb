class CreatePosts < ActiveRecord::Migration

  # def change
  #   create_table :posts do |t|
  #
  #     t.timestamps
  #   end
  # end

  def up
    create_table :posts do |t|
      t.string 'author'
      t.string 'imageURL'
      t.text 'body'
      t.timestamps
    end
  end

  def down
    drop_table :posts
  end

end
