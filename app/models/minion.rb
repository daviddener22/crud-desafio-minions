class Minion < ApplicationRecord
    validates :preco, presence: true
    validates :nome, length: { minimum: 6}
end
