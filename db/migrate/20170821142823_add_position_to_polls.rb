class AddPositionToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :context_y, :integer
  end
end
