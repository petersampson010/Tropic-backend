class AddColumnToGrowlists < ActiveRecord::Migration[6.0]
  def change
    add_column :growlists, :start_time, :string
  end
end