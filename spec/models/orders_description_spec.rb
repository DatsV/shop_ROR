require 'rails_helper'

RSpec.describe OrdersDescription, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:item) }
end
