class BattleLevel < ActiveHash::Base
  include ActiveHash::Associations
  has_many :games
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1回戦レベル' },
    { id: 3, name: '3回戦レベル' },
    { id: 4, name: 'ベスト16レベル' },
    { id: 5, name: 'ベスト8レベル' },
    { id: 6, name: 'ベスト4レベル' },
    { id: 7, name: '決勝進出レベル' },
    { id: 8, name: '甲子園出場レベル' }
  ]
end