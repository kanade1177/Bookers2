class Group < ApplicationRecord
  has_many :group_users
  has_many :user, through: :group_users
  
  vallidates :name, presence: true
  vallidates :introduction, presence: true
  attachment :image, destroy: false
end
