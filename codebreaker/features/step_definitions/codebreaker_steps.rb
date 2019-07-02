class MyOutput
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def my_output
  @my_output ||= MyOutput.new
end

# Start game
Given /^I am not yet playing$/ do
  game = Codebreaker::Game.new(my_output)
end

When /^I start a new game$/ do
  game = Codebreaker::Game.new(my_output)
  game.start('1234')
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(my_output.messages).to include(message)
end

# Submit guess

Given "the secret code is {string}" do |string|
  @game = Codebreaker::Game.new(my_output)
  @game.start(string)
end

When "I guess {string}" do |string|
  #pending # Write code here that turns the phrase above into concrete actions
  @game.guess(string)
end

Then "the mark should be {string}" do |string|
  #pending # Write code here that turns the phrase above into concrete actions
  expect(my_output.messages).to include(string)
end
