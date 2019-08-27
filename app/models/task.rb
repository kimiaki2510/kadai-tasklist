class Task < ApplicationRecord
    validates :content, presence: true, length: {minimum: 10}
    validates :status, presence: true, length: {minimum: 10}
    
end
