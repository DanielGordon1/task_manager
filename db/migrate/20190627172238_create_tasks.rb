class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :action
      t.boolean :done, default: false
      t.datetime :finished_at

      t.timestamps
    end
  end
end
