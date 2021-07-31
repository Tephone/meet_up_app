class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lesson_resavations, dependent: :destroy #レッスンの予約情報を取得
  has_many :lessons_reserved, through: :lesson_resavations, source: :lesson  #予約したレッスン情報を取得
  validates :name, presence: true
end
