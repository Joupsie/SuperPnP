class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews


  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
                    against: [ :name ],
                    using: { tsearch: { prefix: true } }


def is_available?(start_date, end_date)
  bookings.each do |b|
    return false if (b.starts_at..b.ends_at).overlaps?(start_date.to_date..end_date.to_date)
  end
  true
end
end
