require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) } 
  it { should have_many(:orders_descriptions) } 
end
