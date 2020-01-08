class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :bot_name
      t.string :alt_name
      t.string :img_url
      t.string :description
      t.string :uses
      t.string :health
      t.string :climate
      t.string :soil
      t.string :propagation

      t.timestamps
    end
  end
end
