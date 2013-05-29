# What’s this?

A dummy Rails app in which I demonstrate the use of several custom `/app` subdirectories: `services`, `presenters`, `validators`, and `inputs`.

## Setup

    bundle install
    bundle exec rake db:setup
    bundle exec rails server

## Flow

You should check out the [step by step](https://github.com/rafBM/opencode12-rails/commits) progress of how I refactored things.

An easy way to do this in your local cloned repo is to `git rebase -i c351757`, change all `pick` to `e`, then `git rebase --continue` once for each commit.

## See also

- <http://railscasts.com/episodes/287-presenters-from-scratch>
- <http://railscasts.com/episodes/398-service-objects>
- <http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/>
