class CreatePlantGrowths < ActiveRecord::Migration[6.0]
  def change
    create_table :plant_growths do |t|
      t.string :name
      t.integer :germinate_s
      t.integer :germinate_f
      t.integer :sprouting_s
      t.integer :sprouting_f
      t.integer :harvest_s
      t.integer :harvest_f
      t.integer :maturity_s
      t.integer :maturity_f
      t.integer :pot_s
      t.integer :pot_f
      t.integer :protect_s
      t.integer :protect_f
      t.integer :flowering_s
      t.integer :flowering_f
      t.integer :fruiting_s
      t.integer :fruiting_f
      t.integer :fertilize_s
      t.integer :fertilize_f
      t.integer :bloom_s
      t.integer :bloom_f
      t.integer :outside_s
      t.integer :outside_f
      t.timestamps
    end
  end
end
