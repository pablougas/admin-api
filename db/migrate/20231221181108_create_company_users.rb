class CreateCompanyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :company_users do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
