class Report < ApplicationRecord
    MAX_EDITIONS = 5.freeze
    validates :title, :content, presence: true
    validates :editions_count, comparison: { less_than_or_equal_to: MAX_EDITIONS }, on: :editor
    enum report_type: [:report, :digest]
end
