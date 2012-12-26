class AddColumnPhoneNoToProducts < ActiveRecord::Migration
  def change
    add_column :products, :phone_no, :string
  end
end
