class AddUrlToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :url, :text
  end
end
