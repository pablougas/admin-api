class Project < ApplicationRecord
  before_save :downcase_fields

  belongs_to :user
  belongs_to :company
  belongs_to :project_manager, :class_name => 'User'
  belongs_to :owner, :class_name => 'User', optional: true
  belongs_to :designer, :class_name => 'User', optional: true

  has_one :location

  # validates_presence_of :user
  validates_presence_of :project_manager
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :company_id

  has_one_attached :avatar

  accepts_nested_attributes_for :location

  def downcase_fields
    self.name.downcase!
  end
end
