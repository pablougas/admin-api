class CompanyUser < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates_presence_of :company_id
  validates_presence_of :user_id

  validates_uniqueness_of :user_id, scope: :company_id
  
  accepts_nested_attributes_for :user
end
