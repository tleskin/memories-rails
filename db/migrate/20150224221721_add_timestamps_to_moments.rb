class AddTimestampsToMoments < ActiveRecord::Migration
  def change
    add_column :moments, :created_at, :datetime, null: false
    add_column :moments, :updated_at, :datetime, null: false
  end
end
