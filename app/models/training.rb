class Training < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 3 }
  validates :date, presence: true
  validates :weight, numericality: { only_integer: true }
end
