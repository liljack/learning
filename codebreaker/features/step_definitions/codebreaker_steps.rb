Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  Codebreaker::Game.new.start
end

Then /^I should see "([^"]*)"$/ do |arg1|
  pending
end
class Output
  def messages
    @messages ||= []
  end
  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end
