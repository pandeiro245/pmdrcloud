class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.integer :soundcloud_id
      t.integer :youtube_id

      t.timestamps
    end
  end
end
