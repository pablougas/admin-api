class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.references :owner, null: true
      t.references :project_manager, null: false
      t.references :designer, null: true
      t.datetime :start_date
      t.datetime :projected_start_date
      t.datetime :end_date
      t.datetime :projected_end_date
      t.datetime :deleted_at
      
      t.timestamps
    end

    add_foreign_key :projects, :users, column: :owner_id, primary_key: :id
    add_foreign_key :projects, :users, column: :project_manager_id, primary_key: :id
    add_foreign_key :projects, :users, column: :designer_id, primary_key: :id
  end
end
