require 'rails_helper'

RSpec.describe City, :type => :model do
  describe 'validation' do
    context "not correct city's name" do
      let(:city) {City.new name: 'New York'}

      before :each do
        allow(Geocoder).to receive(:search).and_return([])
      end

      subject{city.valid?}

      it {should be_falsey}
      it {expect{subject}.not_to change{city.geo_name}}
    end
  end
end
