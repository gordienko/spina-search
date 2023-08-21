# Spina Search

Easily setup search in your Spina CMS app

### Install

```ruby
gem 'spina-search', github: 'gordienko/spina-search'

rails g spina_search:install
rails runner "Spina::Page.reindex"
```
Add search to theme.plugins and restart your server.
