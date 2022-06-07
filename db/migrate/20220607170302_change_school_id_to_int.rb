class ChangeSchoolIdToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :enrollments, :school_id, 'integer USING CAST(school_id AS integer)'
  end
end
