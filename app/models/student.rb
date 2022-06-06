class Student < ApplicationRecord
  belongs_to :school
  has_many :enrollments
  has_many :cohorts, through: :enrollments

  validates :school, presence: true
  validate :no_active_enrollments_before_transfer

  def full_name
    "#{first_name} #{last_name}"
  end

  def enrolled_courses
    cohorts.collect(&:name).join(', ')
  end

  def active_enrollment?
    self.enrollments.active.empty?
  end

  private 
  def no_active_enrollments_before_transfer
    actives  = self.enrollments.active.other_school(self.school_id)
    if !actives.empty?
      errors.add(:school_id, "Student has an active enrollment in a different school.")
    end
  end
end
