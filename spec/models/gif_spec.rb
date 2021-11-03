require './spec/rails_helper.rb'

RSpec.describe Gif do
  subject { described_class.new(:user => user, :file => file) }

  let(:user) { create(:user) }
  let(:file) { fixture_file_upload( file_path, file_type) }
  let(:file_type) { "image/gif" }
  let(:file_path) { Rails.root.join( "spec", "support", "fixtures", "example_gif_files", file_name)}
  let(:file_name) { "basic.gif" }

  it "is valid" do
    expect(subject).to be_valid
  end

  describe "file_validation" do
    context "when the file is over 1MB" do
      let(:file_name) { "too_big.gif" }

      it "is invalid" do
        expect(subject).not_to be_valid
        expect(subject.errors[:file]).to include("must be below 1MB")
      end
    end

    context "when the file is not a gif" do
      let(:file_name) { "not_a_gif.txt" }
      let(:file_type) { "text/plain" }

      it "is invalid" do
        expect(subject).not_to be_valid
      end
    end
  end

  describe "gifs belong to a user" do
    let(:user) { nil }

    it "is invalid" do
      expect(subject).not_to be_valid
    end
  end
end
