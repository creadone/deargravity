class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.date :date
      t.integer :weight

      t.timestamps null: false
    end
  end
end
