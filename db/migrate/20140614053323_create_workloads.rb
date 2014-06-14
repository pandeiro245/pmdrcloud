class CreateWorkloads < ActiveRecord::Migration
  def change
    create_table :workloads do |t|
      t.integer :user_id
      t.integer :music_id
      t.datetime :started_at
      t.string :title
      t.text :memo
      t.boolean :is_done

      t.timestamps
    end
  end
end
