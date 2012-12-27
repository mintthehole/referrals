class ChangeDataTypeForRatingFeedback < ActiveRecord::Migration
  def up
  	change_table :feedbacks do |t|
      t.change :rating, :decimal, :precision => 4, :scale => 2
    end
  end

  def down
  end
end
