class Team < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :member
  belongs_to :team_level

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :member_id
    validates :team_level_id
  end

end
