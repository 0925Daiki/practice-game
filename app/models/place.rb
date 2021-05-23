class Place < ActiveHash::Base
  include ActiveHash::Associations
  has_many :games
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '本校グラウンド' },
    { id: 3, name: '対戦相手グラウンド' },
    { id: 4, name: '球場' },
    { id: 5, name: 'その他' }
  ]
end