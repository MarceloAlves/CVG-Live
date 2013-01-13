# CVG Live Site

Website used for tournaments hosted by [Central Valley Gamers](http://www.centralvalleygamers.com).

## Project Setup

 Create a `challonge.rb` file in `config/initializers`:

```ruby
require 'challonge-api'

Challonge::API.username = 'USERNAME'
Challonge::API.key = 'API KEY'
```

 In `app/controllers/home_controller.rb`, modify line 6 with your tournament name.

Run `rake db:migrate`

When first visiting the homepage, all entries will be created in the database. When changes are made on the Challonge website, running `rake update_matches` will update records.

## Additional Info

### Requirements

* Challonge API [https://bitbucket.org/corneldm/challonge-api/wiki/Home]()

### Maintainers

Marcelo Alves (https://github.com/marceloalves)

### License
MIT License. Copyright 2013 Central Valley Gamers. http://www.centralvalleygamers.com