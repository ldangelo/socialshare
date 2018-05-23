# Socialshare

Elixir application to automatically share newly posted medium articles to linkedin.

## How does it work?

The application authenticates users through google.  Once a user is authenticated they can authorize the application to post articles on linkedin.  The application scrapes an RSS feed and when a new article appears it will automatically share the article for all users.

## SETUP

In order for the application to work a few environment variables need to be set:

export GOOGLE_CLIENT_ID=  Google oauth client id
export GOOGLE_CLIENT_SECRET= Google oauth client secret
export GOOGLE_REDIRECT_URI="/auth/private/callback"
export LINKEDIN_CLIENT_ID= LinkedIn oauth client id
export LINKEDIN_CLIENT_SECRET= LinkedIn oauth client secret
export SCRAPETIMER=6000000
export FEED_URL=https://blog.fortiumpartners.com/feed
export HOST=localhost
export PORT=4000
export SECRET_KEY_BASE=mysupersecretkeybase
export DB_HOSTNAME=localhost
export DB_USERNAME=db_user
export DB_PASSWORD=db_pass

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
