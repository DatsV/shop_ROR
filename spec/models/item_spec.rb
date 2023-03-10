require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price)
    .is_greater_than(0) }

  it { should have_many(:orders_descriptions) } 
end
