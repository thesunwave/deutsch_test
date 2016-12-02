class Numberplan < ApplicationRecord
  include PgSearch

  pg_search_scope :search,
                  against: [
                      [:prefix, 'A'],
                      [:usage, 'C'],
                      [:comment, 'B']
                  ],
                  using: {
                      tsearch: { any_word: true },
                      trigram: { threshold: 0.33 }
                  },
                  ignoring: :accents
end
