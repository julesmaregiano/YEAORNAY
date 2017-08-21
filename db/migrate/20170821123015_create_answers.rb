class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :value
      t.references :poll, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
