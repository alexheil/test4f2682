class CreateRelationships < ActiveRecord::Migration
  def change
    create_table(:relationships) do |t|
      t.references :fan
      t.references :artist


      t.timestamps
    end

    add_index :relationships, :fan_id
    add_index :relationships, :artist_id
    add_index :relationships, [:fan_id, :artist_id], unique: true
  end
end
