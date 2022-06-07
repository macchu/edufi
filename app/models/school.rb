class School < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :cohorts, dependent: :destroy
  has_many :teachers, dependent: :destroy

  scope :except_school, -> (school_id) { where.not(id: school_id)}
end
