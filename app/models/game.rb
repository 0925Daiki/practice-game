class Game < ApplicationRecord

belongs_to :user


extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :recruit
  belongs_to :place
  belongs_to :battle_level

with_options numericality: { other_than: 1 } do
  validates :recruit_id
  validates :place_id
  validates :battle_level_id
end

validates :practice_date, presence: true
validates :comment, presence: true


end
