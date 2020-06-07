require 'rails_helper'

describe User, type: :model do
  let!(:user) { create(:user) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:image_url) }
  it { should validate_uniqueness_of(:username) }
  it { is_expected.to validate_url_of(:image_url) }
end

