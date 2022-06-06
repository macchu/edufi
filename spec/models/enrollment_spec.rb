require 'rails_helper'

describe Enrollment do
  let(:school) { create(:school) }
  let(:yesterday) { Time.now.yesterday }
  let(:last_year) { Time.now.last_year }
  let(:tomorrow) { Time.now.tomorrow }
  
  describe ".active_enrollments" do
    context "One inactive enrollment" do
      let!(:enrollment_1) { create(:enrollment, school: school, start_date: last_year, end_date: yesterday) }

      it "returns empty" do
        expect(Enrollment.active_enrollments).to be_empty
      end
    end

    context "One active enrollment" do
        let!(:enrollment_1) { create(:enrollment, school: school, start_date: last_year, end_date: tomorrow) }
  
        it "returns enrollment_1" do
          expect(Enrollment.active_enrollments).to include enrollment_1
        end
      end
  end

end
