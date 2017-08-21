class AddTimeToDateInPolls < ActiveRecord::Migration[5.1]
  def change
    change_column :polls, :ends_at, :datetime
  end
end
