class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.date :when
      t.string :title
      t.integer :estimate
      t.integer :actual
      t.integer :status, default: 0, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
