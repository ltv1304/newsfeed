class Report < ApplicationRecord
    validates :title, :content, presence: true
    validates :editions_count, comparison: { less_than: 5 }, on: :editor
    enum report_type: [:report, :digest]
end
