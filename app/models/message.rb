class Message < ApplicationRecord

  belongs_to :game
  belongs_to :user

  validates :text, presence: true

end
