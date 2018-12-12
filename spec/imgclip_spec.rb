require "spec_helper"

describe Imgclip do
  describe "::VERSION" do
    it "has a version number" do
      expect(Imgclip::VERSION).not_to be nil
    end
  end

  describe ".clipboard_to_file" do
    let!(:path) { "/tmp/cat_copy.jpg" }

    subject { described_class.clipboard_to_file path }

    context "with image in clipbaord" do
      before do
        system "xclip -selection clipbaord -target image/jpeg -i spec/fixtures/cat.jpg"
        raise("Pls install xclip to test it locally") unless $?.success?
      end

      subject { described_class.clipboard_to_file path }

      it "should return path" do
        is_expected.to eq path
      end

      it "should create image" do
        expect(File.exist?(path)).to eq true
      end

      it "should set file mime type to image/jpeg" do
        mimetype = `file --brief --mime-type #{ path }`.strip
        expect(mimetype).to eq "image/jpeg"
      end
    end

    context "with text in clipboard" do
      before do
        system "man xclip | xclip -selection clipbaord -i"
        raise("Pls install xclip to test it locally") unless $?.success?
      end

      it "should raise ArgumentError" do
        expect { subject }.to raise_exception(ArgumentError)
      end
    end
  end
end
