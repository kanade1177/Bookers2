class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?", "#{word}%")
    elsif search == "backword_match"
      @book = Book.where("title LIKE?", "%#{word}")  
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "%#{word}%")  
    else
      @book = Book.all
    end  
    
  end  
  
  def self.last_week
    Book.joins(:favorites).where(favorites: {created_at: 0.days.ago.prev_week..0.days.ago.prev_week(:sunday)}).order("count(*) desc")
  end

  validates :title, presence:true
  validates :body, presence:true, length: { maximum: 200 }

end
