class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable,  :validatable
        #  :rememberable,
  
  has_many :orders

  validates :first_name, :last_name, :email,  presence: true

end
