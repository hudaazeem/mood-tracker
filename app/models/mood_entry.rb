class MoodEntry < ApplicationRecord
    validates :entry_date, presence: true
    validates :mood, presence: true
    validates :note, length: {maximum:150}
end
