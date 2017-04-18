# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  COLORS = %w(black white orange grey).freeze

  validates :birth_date, :color, :name, :sex, :description,
            presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    age_in_days = (Time.now.to_date - birth_date).to_i
    age_in_days / 365
  end

  def self.colors
    COLORS
  end
end
