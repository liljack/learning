require 'spec_helper'

module Codebreaker
  describe Marker do
  
    describe "#exact_match_count" do
      context "with no matches" do
        it "return 0" do
          marker = Marker.new('1234', '5555')
          expect(marker.exact_match_count).to eq(0)
        end
      end

      context "with 1 exact match" do
        it "return 1" do
          marker = Marker.new('1234', '1555')
          expect(marker.exact_match_count).to eq(1)
        end
      end

      context "with 1 number match" do
        it "return 0" do
          marker = Marker.new('1234', '2555')
          expect(marker.exact_match_count).to eq(0)
        end
      end

      context "with 1 exact match and 1 number match" do
        it "return 1" do
          marker = Marker.new('1234', '1525')
          expect(marker.exact_match_count).to eq(1)
        end
      end
    end

    describe "#number_match_count" do
      context "with no matches" do
        it "return 0" do
          marker = Marker.new('1234', '5555')
          expect(marker.number_match_count).to eq(0)
        end
      end

      context "with 1 number match" do
        it "returns 1" do
          marker = Marker.new('1234', '2555')
          expect(marker.number_match_count).to eq(1)
        end
      end

      context "with 1 exact match" do
        it "returns 0" do
          marker = Marker.new('1234', '1555')
          expect(marker.number_match_count).to eq(0)
        end
      end

      context "with 1 exact match and 1 number match" do
        it "returns 1" do
          marker = Marker.new('1234', '1525')
          expect(marker.number_match_count).to eq(1)
        end
      end

      context "with 1 exact match duplicated in guess" do
        it "returns 0" do
          #skip("refactor number_match_count") # DON'T use pending with rspec 3. pending will run the test. if the test pass, it will mark it as failed because if it pass, it shouldn't be pending... (weird). So use skip to always skip test. Pending will be skipped only if it fails
          marker = Marker.new('1234', '1155')
          expect(marker.number_match_count).to eq(0)
        end
      end
    end
  end
end

