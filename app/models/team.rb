class Team < ApplicationRecord

  belongs_to :user

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :menmber_id
    validates :team_level_id
    validates :status_id
  end

end
