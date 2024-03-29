require 'rails_helper'

RSpec.describe 'Enrollment Requests', type: :request do
  let(:school) { create(:school)}
  let(:cohort) { create(:cohort, school: school )}
  let(:student) {create(:student, school: school)}
  describe 'GET /enrollments' do
    it 'returns a successful response' do
      get school_enrollments_url(school)

      expect(response).to be_successful
    end
  end

  describe 'GET /enrollments/new' do
    it 'returns a successful response' do
      get new_school_enrollment_url(school)

      expect(response).to be_successful
    end
  end

  describe 'POST /enrollments' do
    let(:enrollment_params) {
      {
        cohort_id: cohort.id,
        start_date: 1.month.ago,
        end_date: 3.month.from_now,
        school_id: school.id,
        student_id: student.id
      }
    }

    it 'creates an enrollment and redirects to the enrollment show page' do
      expect {
        post(school_enrollments_url(school.id), params: { enrollment: enrollment_params })
      }.to change { Enrollment.count }.by(1)

      expect(response).to redirect_to(school_enrollment_url(Enrollment.last.school, Enrollment.last))
    end
  end

  describe 'GET /enrollments/:id' do
    let(:enrollment) { create(:enrollment) }

    it 'returns a successful response' do
      get school_enrollment_url(enrollment.school, enrollment)

      expect(response).to be_successful
    end
  end

  describe 'GET /enrollments/:id/edit' do
    let(:enrollment) { create(:enrollment) }

    it 'returns a successful response' do
      get edit_school_enrollment_url(enrollment.school, enrollment)

      expect(response).to be_successful
    end
  end

  describe 'PATCH /enrollments/:id' do
    let(:enrollment) { create(:enrollment) }
    let(:enrollment_params) { { start_date: new_start_date } }
    let(:new_start_date) { 2.days.ago.to_date }

    it 'updates the enrollment and redirects to the enrollment show page' do
      patch school_enrollment_url(enrollment.school, enrollment, params: { enrollment: enrollment_params })

      expect(enrollment.reload.start_date).to eq(new_start_date)
      expect(response).to redirect_to(school_enrollment_url(enrollment.school, enrollment))
    end
  end

  describe 'DELETE /enrollments/:id' do
    let!(:enrollment) { create(:enrollment) }

    it 'deletes the enrollment and redirect to the index page' do
      expect {
        delete school_enrollment_url(enrollment.school, enrollment)
      }.to change { Enrollment.count }.by(-1)

      expect(response).to redirect_to(school_enrollments_url)
    end
  end
end
