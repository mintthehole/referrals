class AddPhoneNumberToStore < ActiveRecord::Migration
  def change
    change_table :stores do |t|
      t.string :mobile_number
    end
  end
end
