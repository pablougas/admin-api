class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :legal_name
      t.string :phone
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
