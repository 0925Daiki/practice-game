class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :team
  has_many :games
  has_many :messages

  validates :teacher_name, presence: true
  validates :school_name, presence: true

end
