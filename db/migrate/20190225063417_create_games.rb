class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :playingtime
      t.string :category
      t.string :mechanic
      t.string :designer
      t.string :image_url
      t.string :thumb_url

      t.timestamps
    end
  end
end
