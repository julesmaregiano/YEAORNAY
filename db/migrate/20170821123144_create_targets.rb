class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.references :poll, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
