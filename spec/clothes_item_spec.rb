require 'clothes_item.rb'

describe ClothesItem do
  let(:item) { ClothesItem.new('кепка','головной убор', min: 3, max: 25) }

  describe '::new' do
    it 'initialize instance variables' do
      item.name.should eq 'кепка'
      item.category.should eq 'головной убор'
      item.min_temp.should eq 3
      item.max_temp.should eq 25
    end
  end

  describe '#match_weather' do
    it 'should match weather' do
      expect(item.match_weather?(10)).to be true
    end
    it "shouldn't match weather" do
      expect(item.match_weather?(1)).to be false
    end
  end

  describe '#to_s' do
    it "should return the template string" do
      expect(item.to_s).to eq "кепка (головной убор) 3..25"
    end
  end
end
