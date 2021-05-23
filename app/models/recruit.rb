class Recruit < ActiveHash::Base
  include ActiveHash::Associations
  has_many :games
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '急募（すぐに！）' },
    { id: 3, name: '募集（1ヶ月以内）' },
    { id: 4, name: '募集（1ヶ月後以降）' },
  ]
end