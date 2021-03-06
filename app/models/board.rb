class Board < ApplicationRecord
  # 保存するときに条件に適しているかチェック
  validates :name, presence: true, length: {maximum: 10 }
  validates :title, presence: true, length: {maximum: 30 }
  validates :body, presence: true, length: {maximum: 100 }
end
