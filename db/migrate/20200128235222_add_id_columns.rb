class AddIdColumns < ActiveRecord::Migration[5.2]
  def change
    add_column(:city, :country_id, :int)
    add_column(:review, :city_id, :int) 
  end
end
