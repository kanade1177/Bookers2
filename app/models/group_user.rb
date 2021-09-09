class GroupUser < ApplicationRecord
  belongs_to :user
  blongs_to :group
end
