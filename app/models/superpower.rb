class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews


  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  AUTHORIZED_NAMES = Superpower.name
  validates :NAME, inclusion: { in: AUTHORIZED_NAMES }
  include PgSearch::Model
  pg_search_scope :search_by_name,
                    against: [ :name ],
                    using: { tsearch: { prefix: true } }

end
