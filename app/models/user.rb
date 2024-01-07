class User < ApplicationRecord
  before_save :downcase_fields
  has_and_belongs_to_many :projects

  has_many :company_users, dependent: :destroy
  has_many :companies, through: :company_users

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :phone, presence: true, uniqueness: true, length: {minimum: 10, maximum: 10} 
  
  has_one_attached :avatar, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def downcase_fields
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end
