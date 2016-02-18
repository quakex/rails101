class Post < ActiveRecord::Base
  belongs_to :group
  # 文章内容不能空白
  validates :content, presence: true
end
