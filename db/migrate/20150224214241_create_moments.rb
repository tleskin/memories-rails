class CreateMoments < ActiveRecord::Migration
  def change
    create_table :moments do |t|
      t.text :content
      t.text :caption
      t.datetime :happened_at
      t.string :location
    end
  end
end
