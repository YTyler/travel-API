class AddCitiesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.column :name, :string
  end
end
end
