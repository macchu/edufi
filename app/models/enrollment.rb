class Enrollment < ApplicationRecord
  belongs_to :school
  belongs_to :student
  belongs_to :cohort

  validates :student, presence: true, uniqueness: { scope: :cohort_id }
  validates :school, :cohort, presence: true

  scope :active, -> { where('start_date <= ? AND end_date >= ?', Time.now, Time.now).includes(:cohort) }
  scope :other_school, -> (this_school_id) { where.not(school_id: this_school_id)}
end
