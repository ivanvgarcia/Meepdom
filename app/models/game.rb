class Game < ApplicationRecord
validates :name, uniqueness: true, presence: true
end
