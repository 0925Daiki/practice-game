class Game < ApplicationRecord

belongs_to :user


extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :recruit
  belongs_to :place
  belongs_to :battle_level

with_options numericality: { other_than: 1 } do
  validates :recruit_id
  validates :place_id
end

validates :battle_level_id, presence: true
validates :practice_date, presence: true
validates :comment, presence: true


end
