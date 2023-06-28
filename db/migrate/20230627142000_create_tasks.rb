class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.references :user, null: false, foreign_key: true
      t.boolean :done

      t.timestamps
    end
  end
end
