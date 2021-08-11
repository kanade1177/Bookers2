class PostImage < ApplicationRecord
  blongs_to :user
    attachment :image
end
