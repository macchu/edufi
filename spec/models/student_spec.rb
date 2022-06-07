require 'rails_helper'

describe Student do
  let(:school) { create(:school, name: "Public 1") }
  let(:student) { create(:student, school: school)}
  let(:yesterday) { Time.now.yesterday }

  let(:last_year) { Date.today.last_year }
  let(:tomorrow) { Date.today.tomorrow }
  let(:today) {Date.today }

  describe ".active_enrollment?" do
    context "One inactive enrollment" do
      let!(:enrollment_1) { create(:enrollment, school: school, student: student, start_date: last_year, end_date: today) }
      
      it "returns true" do
        enrollment_1
        expect(student.active_enrollment?).to be true
      end
    end

    context "One active enrollment" do
      let!(:enrollment_2) { create(:enrollment, school: school, student: student, start_date: last_year, end_date: yesterday) }

      it "returns false" do
        expect(student.active_enrollment?).to be false
      end
    end
    context "No enrollments" do
      it "returns false" do
          expect(student.active_enrollment?).to be false
      end
    end
  end
end
