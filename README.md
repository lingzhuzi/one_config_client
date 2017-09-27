# OneConfigClient
Short description and motivation.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'one_config_client'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install one_config_client
```

## Usage
在config/initializers/目录下新建文件one_config.rb，加入以下内容：
```ruby
OneConfigClient::Downloader.new.download if Rails.env == 'production'
```

在config/目录下新建config.yml，加入以下内容：
```
one_config:
  server_url: http://localhost:3001/
  app_name: YOUR_APP_NAME
  env: YOUR_RUN_ENV
  key: YOUR_KEY
  iv: YOU_IV
```


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
