class Blog < ApplicationRecord
    validates :title, {presence: true}
    validates :content, {presence: true}
    validates :UserID, {presence: true}
end
