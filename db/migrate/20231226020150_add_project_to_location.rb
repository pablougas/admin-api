class AddProjectToLocation < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :project, null: false, foreign_key: true
  end
end
