class UsedSub < ApplicationRecord
  belongs_to :submission
  belongs_to :user
  belongs_to :assignment

  delegate :created_at, to: :submission
  delegate :grades, to: :submission

  validate :submission_matches_assignment

  def submission_matches_assignment
    if submission.assignment_id != assignment_id
      errors.add(:base, "Submission / assignment mismatch.")
    end
  end
end
