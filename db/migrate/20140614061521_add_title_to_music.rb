class AddTitleToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :title, :string
  end
end
