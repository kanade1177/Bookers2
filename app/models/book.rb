class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  scope :created_today, -> {where(created_at: Time.zone.now.all_day)}
  scope :created_yesterday, -> {where(created_at: 1.day.ago.all_day)}
  scope :created_thisweek, -> { where(created_at: Time.current.all_week) }
  scope :created_a_week_ago, -> {where(created_at: 1.week.ago.all_day)}
  scope :created_thismonth, -> { where(created_at: Time.current.all_month) }
  scope :created_a_month_ago, -> {where(created_at: 1.month.ago.all_day)}


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





  validates :title, presence:true
  validates :body, presence:true, length: { maximum: 200 }

end
