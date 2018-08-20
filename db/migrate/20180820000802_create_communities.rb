class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :summary
      t.string :icon
      t.string :image

      t.timestamps
    end
  end
end
