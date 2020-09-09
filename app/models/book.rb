class Book < ApplicationRecord
  # バリデーションチェック
  # 空白出ない場合true
  validates :title, :body, presence: true
end
