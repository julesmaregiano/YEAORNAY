class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :context
      t.date :ends_at
      t.boolean :anonym, default: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
