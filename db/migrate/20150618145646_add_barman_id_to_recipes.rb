class AddBarmanIdToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :barman_id, :integer
  end
end
