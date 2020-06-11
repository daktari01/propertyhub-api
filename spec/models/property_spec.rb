require 'rails_helper'

describe Property, type: :model do
  let!(:property) { create(:property) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:rent_sale) }
  it { should validate_presence_of(:description) }
  it 'should allow valid values' do
    %w(residential commercial land).each do |p_type|
      should allow_value(p_type).for(:property_type)
    end
  end
  it { should_not allow_value('other').for(:property_type) }

  context 'residential property with no size value' do
    let(:residential_property) { create(:property) }

    it 'does not require size to have info' do
      residential_property.valid?
      expect(residential_property.errors['size']).to_not include("can't be blank")
    end
  end

  context 'land property' do
    let(:land_without_size) { create(:property, :land, size: nil) }
    let(:land_with_size) { create(:property, :land) }

    it 'requires size property' do
      expect { land_without_size }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Size can't be blank")
    end

    it 'does saves land with size' do
      land_with_size.valid?
      expect(land_with_size.errors['size']).to_not include("can't be blank")
    end
  end

  context 'commercial property' do
    let(:commercial_without_price_per_sqfoot) { create(:property, :commercial, price_per_sqfoot: nil) }
    let(:commercial_with_size) { create(:property, :commercial) }

    it 'requires price_per_sqfoot property' do
      expect { commercial_without_price_per_sqfoot }
        .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Price per sqfoot can't be blank")
    end

    it 'does saves land with size' do
      commercial_with_size.valid?
      expect(commercial_with_size.errors['size']).to_not include("can't be blank")
    end
  end
end
