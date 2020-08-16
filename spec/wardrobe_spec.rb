require 'wardrobe.rb'
require 'clothes_item'

describe Wardrobe do
  let(:wardrobe) { Wardrobe.take_from_dir('./spec/fixtures') }

  describe'::take_from_dir' do
    it 'should return a new object of Wardrobe class' do
      expect(wardrobe).to be_an_instance_of(Wardrobe)
    end
  end

  describe '#create_outfit' do
    describe "should include only uniq item types" do
      let(:types) { wardrobe.create_outfit(16).map(&:category) }
      it "should have only uniq categories" do
        expect(types.uniq.size).to eq types.size
      end
    end

    describe "appropriated temperature" do
      it "should recommend only appropriate items" do
        wardrobe.create_outfit(10).each do |i|
          expect(i.match_weather?(10)).to be true
        end
      end
    end

    describe 'unclude exactly' do
      it "should contain only 1 element" do
        expect(wardrobe.create_outfit(40).size).to eq 1
      end
      it "collection should recommend exactly" do
        expect(wardrobe.create_outfit(40).first.to_s).to eq "Шлепанцы (Обувь) 20..40"
      end
    end
  end
end
