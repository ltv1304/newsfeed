class Report < ApplicationRecord
    enum report_type: [:report, :digest]
end
