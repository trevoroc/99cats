class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def does_not_overlap_approved_request
    unless overlapping_approved_requests.empty?
      errors[:base] << "Cannot overlap with approved rental request"
    end
  end

  private

  def overlapping_requests
    CatRentalRequest
      .where("((?) > start_date AND (?) < end_date OR (?) > start_date AND (?) < end_date) AND cat_id = (?)",
            self.start_date, self.start_date, self.end_date, self.end_date, self.cat_id
            )
  end

  def overlapping_approved_requests
    overlapping_requests.select do |request|
      request.status == "APPROVED"
    end
  end
end
