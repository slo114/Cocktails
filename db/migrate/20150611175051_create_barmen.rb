class CreateBarmen < ActiveRecord::Migration
  def change
    create_table :barmen do |t|
      t.string :barmanname
      t.string :email
      t.timestamps
    end
  end
end
