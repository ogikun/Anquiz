class AddWord < ApplicationRecord
  belongs_to :list
  belongs_to :word
end
