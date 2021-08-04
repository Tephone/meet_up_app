class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :lesson_resavations, dependent: :destroy # レッスンの予約情報を取得
  has_many :lessons_reserved, through: :lesson_resavations, source: :lesson # 予約したレッスン情報を取得
  has_many :purchase_tickets # チケットの購入履歴を取得
  has_many :purchase_tickets_info, through: :purchase_tickets, source: :ticket # 購入したチケット情報を取得
  validates :name, presence: true

  def lesson_count
    lesson_count = self.purchase_tickets_info.pluck(:lesson_count).sum
    used_tickets_count = self.lesson_resavations.count
    lesson_count - used_tickets_count
  end
end
