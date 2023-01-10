class PersonalChat < ApplicationRecord
    belongs_to :pair, class_name: 'User'
    belongs_to :send, class_name: 'User'
end
