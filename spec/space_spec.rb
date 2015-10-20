require 'spec_helper'

describe Chess::Space do
  let(:space) { Chess::Space.new }

  describe "#new" do
    it "creates a new space instance" do
      expect(space).to be_an_instance_of(Chess::Space)
    end
  end
end
