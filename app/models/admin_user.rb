class AdminUser < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :user_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  enum role: %i[admin sub_admin]
end
