class Company < ApplicationRecord
  has_many :company_users, dependent: :destroy
  has_many :users, through: :company_users
  has_many :projects
  
  accepts_nested_attributes_for :company_users
end
