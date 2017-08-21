class CreateBelongings < ActiveRecord::Migration[5.1]
  def change
    create_table :belongings do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
