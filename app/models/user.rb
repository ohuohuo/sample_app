class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  has_secure_password #只要数据库中有 password_digest 列，在模型文件中加入 has_secure_password 方法后就能验证用户身份了。
  validates :password, length: { minimum: 6 }
end
