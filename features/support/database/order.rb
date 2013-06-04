require_relative 'puppy'
class Order <ActiveRecord::Base

  has_many :adoptions

end


FactoryGirl.define do
  #default data
  factory :order do
    name 'Cheezy'
    address '123 Main Street'
    email 'cheezy@example.com'
    pay_type 'Check'
  end

  #association
  factory :adoption do
    association :order
    puppy Puppy.find_by_name('Brook')
  end
end