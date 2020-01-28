require 'faker'
FactoryBot.define do
  factory :item do
    name { 'user#{rand()}'}
    done {false}
    todo_id {nil}
  end
end
