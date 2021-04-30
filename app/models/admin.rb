class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :reservations, dependent: :destroy

  def self.search(search)
    if search
      Admin.where(['address LIKE ?', "%#{search}%"])
    else
      Admin.all
    end
  end
end
