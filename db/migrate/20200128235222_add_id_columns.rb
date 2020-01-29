class AddIdColumns < ActiveRecord::Migration[5.2]
  def change
    add_column(:cities, :country_id, :int)
    add_column(:reviews, :city_id, :int) 
  end
end
