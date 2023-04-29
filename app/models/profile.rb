class Profile < ApplicationRecord
    belongs_to :user
    enum role: [:user, :editor, :admin]
end
