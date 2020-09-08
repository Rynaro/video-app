class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.references :channel, null: false, foreign_key: true
      t.string :title
      t.string :status
      t.string :slug

      t.timestamps
    end
    add_index :videos, :slug, unique: true
  end
end
