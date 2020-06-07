require 'rails_helper'

describe Property, type: :model do
  let!(:property) { create(:property) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:rent_sale) }
  it { should validate_presence_of(:description) }
end
