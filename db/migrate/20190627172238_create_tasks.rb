class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :action
      t.boolean :completed, default: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end
