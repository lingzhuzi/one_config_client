require 'yaml'
require 'net/http'
require 'active_support/json'
require 'one_config_client/encrypt_helper'

module OneConfigClient
  class Downloader

    def initialize
      @options = read_configs
    end

    def read_configs
      config_filename = "config/config.yml"
      raise "There's no config file: #{config_filename}" if !File.exist?(config_filename)
      YAML.load_file(config_filename)['one_config']
    end

    def download
      uri = URI("#{@options['server_url']}/download/#{@options['app_name']}/#{@options['env']}")

      res = Net::HTTP.get_response(uri)
      raise "Error occurred during downloading config files: #{res.code}" if res.code.to_i != 200
      data = res.body
      key, iv = @options['key'].to_s, @options['iv'].to_s
      json = EncryptHelper.decode(data, key, iv)
      configs = ActiveSupport::JSON.decode(json)
      configs.each do |config|
        name = config['name']
        content = config['content']
        File.open("config/#{name}", 'w') do |file|
          file.print content
        end
      end
    end
  end
end