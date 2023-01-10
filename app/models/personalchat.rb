class Personalchat < ApplicationRecord
    belongs_to :pair_id, class_name: "User"
end
