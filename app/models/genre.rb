class Genre < ApplicationRecord
    before_action :authenticate_admin!
    has_many :items

    validates :name, presence: true, uniqueness: true
end
