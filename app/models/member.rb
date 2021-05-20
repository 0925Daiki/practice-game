class Member < ActiveHash::Base
  include ActiveHash::Associations
  has_many :teams
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '9名以下' },
    { id: 3, name: '10名~19名' },
    { id: 4, name: '20名~29名' },
    { id: 5, name: '30名~50名' },
    { id: 6, name: '50名以上' }
  ]
end


