class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key (:cities, :countries)
    add_foreign_key (:reviews, :cities)
  end
end
