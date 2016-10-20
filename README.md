# Robot

The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robot', github: 'atanych/robot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install robot

## Usage
Add robot scenario to your application (for example robot_scripts/first_script)

```ruby
require 'robot'

manager = Robot::Manager.new
puts manager.run_script('robot_scripts/first_script')
```

If need to prevent not valid robot scenario. Use second param
```ruby
puts manager.run_script('robot_scripts/first_script', false)
```