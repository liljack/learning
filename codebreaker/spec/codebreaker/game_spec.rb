require 'spec_helper'

module Codebreaker
  describe Game do
    let(:my_output) { double('my_output').as_null_object }
    let(:game)      { Game.new(my_output) }

    describe "#start" do
      it "sends a welcome message" do
        expect(my_output).to receive(:puts).with("Welcome to Codebreaker!")
        game.start('1234')
      end

      it "prompts for the first guess" do
        expect(my_output).to receive(:puts).with("Enter guess:")
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no matches" do
        it "sends a mark with ''" do
          game.start('1234')
          expect(my_output).to receive(:puts).with('')
          game.guess('5555')
        end
      end

      context "with 1 number match" do
        it "sends a mark with '-'" do
          game.start('1234')
          expect(my_output).to receive(:puts).with('-')
          game.guess('2555')
        end
      end

      context "with 1 exact match" do
        it "send a mark with '+'" do
          game.start('1234')
          expect(my_output).to receive(:puts).with('+')
          game.guess('1555')
        end
      end
    end
  end
end
