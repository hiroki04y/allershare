class Tag < ApplicationRecord
    has_many :users, through: :usertags
    has_many :usertags
    accepts_nested_attributes_for :usertags
end
