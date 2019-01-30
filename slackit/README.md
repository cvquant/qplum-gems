# Slackit

Welcome to Slackit gem!

Slackit lets you define custom messages for slack and send them to desired channels.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slackit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install slackit

## Configuration

Slackit has a range of configuration options, which you can configure, both globally and on a per-channel basis:

Create an initializer 
```config/initializers/slackit.rb```

```ruby
Slackit.setup do |config|

  config.webhook_url = "https://hooks.slack.com/services/MySlack/MySlackWebhookUrl"

  config.default_sender = "MyApplication"

  config.channels = ["#general", "#exceptions", "#marketing"]

  config.channel :general do |channel|
    channel.default_sender = "General Sender"
  end

  config.channel :exceptions do |channel|
    channel.default_color = "danger"
    channel.default_sender = "Exception Notifier"
  end

  config.channel :marketing do |channel|
    channel.default_color = "#666666"
  end

end
```

## Usage

Once you have configured webhook_url, list of channels and global and channel properties, its time to use Slackit!

Create a new message
```ruby
slack_message = Slackit::Message.new("My first slack message")
```

Send message to one of the defined channels
```ruby
slack_message.send_to_marketing
```
Or alternatively,
```ruby
Slackit::Message.new("My first slack message").send_to_marketing
```

Add pretext to message
```ruby
  slack_message.add_pretext("[PRETEXT]")
```

Add fields to message
```ruby
  slack_message.add_fields({ key1: "value1", key2: "value2" })
```

Set message's color
```ruby
  slack_message.set_color("#ff00ff")
```

Send message from specific sender
```ruby
  slack_message.from("Message Sender")
```

Mention people in the message
```ruby
  slack_message.mention("mention1")
```
Or
```ruby
  slack_message.mention(["mention1", "mention2"])
```

Attach a table in the message
```ruby
  slack_message.attach_table([["column1", "column2"],["row11", "row12"],["row21", "row22"]])
```

Enjoy using Slackit!!


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cvquant/qplum-gems/slackit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Slackit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cvquant/qplum-gems/slackit/blob/master/CODE_OF_CONDUCT.md).
