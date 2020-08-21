require 'clothes_item'

describe ClothesItem do
  let(:item) { ClothesItem.new('кепка','головной убор', min: 3, max: 25) }

  describe '::new' do
    it 'initialize instance variables' do
      expect(item.name).to eq 'кепка'
      expect(item.category).to eq 'головной убор'
      expect(item.min_temp).to eq 3
      expect(item.max_temp).to eq 25
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
