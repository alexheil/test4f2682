class CreateArtistMerches < ActiveRecord::Migration
  def change
    create_table(:artist_merches) do |t|
      t.references :artist
      t.string :paypal_email
      t.string :about
      t.string :merch_name
      t.text :merch_description
      t.integer :base_price
      t.integer :shipping_price
      t.integer :total_price
      t.integer :quantity
      t.string :options
      t.text :return_policy
      t.text :shipping_info

      t.timestamps
    end

    add_index :artist_merches, :artist_id
  end
end
