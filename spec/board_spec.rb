require 'spec_helper'

describe Chess::Board do
  let(:board) { Chess::Board.new }

  describe "#new" do
    it "creates a new board instance" do
      expect(board).to be_an_instance_of(Chess::Board)
    end

    it "has a spaces array" do
      expect(board.instance_eval { @spaces }).to be_an_instance_of(Array)
    end

    it "has 64 spaces" do
      expect(board.instance_eval { @spaces }.length).to eql 64
    end

    it "has an array full of Chess::Space objects" do
      all_are_spaces = board.instance_eval { @spaces }.all? { |space| space.is_a? Chess::Space } # Each element of the spaces array is a Space obj
      expect(all_are_spaces).to eql True
    end
  end

end
