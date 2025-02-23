require_dependency 'jwt_denylist'
class Admin < ApplicationRecord
  # Include default devise modules. Others available are
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
    validates :email, presence: true, uniqueness: true
    has_secure_password
  end
  