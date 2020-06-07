class User < ApplicationRecord
  has_many :properties
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  validates :username, :image_url, presence: true
  validates :username, uniqueness: true
  validates :image_url, url: true
end
