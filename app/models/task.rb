class Task < ApplicationRecord
    #Userとtaskの１対多を表現
    belongs_to :user
    #内容の空欄なし10字以内
    validates :content, presence: true, length: {maximum: 10}
    #タスクの空欄なし10字以内
    validates :status, presence: true, length: {maximum: 10}
end
