require 'spec_helper'

describe Chess::Coords do
  let(:coords) { Chess::Coords.new(0, 4) }

  describe "#new" do

    it "returns a new Coords object" do
      expect(coords).to be_an_instance_of Chess::Coords
    end
  end

  describe "#x" do

    it "returns the correct x value" do
      expect(coords.x).to eql 0
    end
  end

  describe "#y" do
    it "returns the correct y value" do
      expect(coords.y).to eql 4
    end
  end

  describe "#on_board?" do
    context "coords are off board" do
      let(:bad_coords_1) { Chess::Coords.new(-1, 5) }
      let(:bad_coords_2) { Chess::Coords.new(4, 8) }
      let(:bad_coords_3) { Chess::Coords.new(3, -1) }
      let(:bad_coords_4) { Chess::Coords.new(8, 6) }

      it "returns false" do
        expect(bad_coords_1.on_board?).to eql false
      end
    end

    context "coords are on board" do

    end
  end
end
