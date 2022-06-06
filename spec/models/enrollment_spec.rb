require 'rails_helper'

describe Enrollment do
  let(:school) { create(:school, name: "Public 1") }
  let(:yesterday) { Time.now.yesterday }
  let(:last_year) { Time.now.last_year }
  let(:tomorrow) { Time.now.tomorrow }
  
  describe "#active" do
    context "One inactive enrollment" do
      let!(:enrollment_1) { create(:enrollment, school: school, start_date: last_year, end_date: yesterday) }

      it "returns empty" do
        expect(Enrollment.active).to be_empty
      end
    end

    context "One active enrollment" do
        let!(:enrollment_1) { create(:enrollment, school: school, start_date: last_year, end_date: tomorrow) }
  
        it "returns enrollment_1" do
          expect(Enrollment.active).to include enrollment_1
        end
      end
  end

  describe "#other_school" do
    let!(:enrollment_1) { create(:enrollment, school: school, start_date: last_year, end_date: tomorrow) }
    let(:school_2) { create(:school, name: "Private 1") }
    let!(:enrollment_2) { create(:enrollment, school: school_2, start_date: last_year, end_date: tomorrow)}
    
    it "returns enrollment_1 when given school_2" do
      expect(Enrollment.other_school(school_2.id)).to include enrollment_1
    end

    it "returns enrollment_2 when given school_1" do
      expect(Enrollment.other_school(school.id)).to include enrollment_2
    end
  end
end
