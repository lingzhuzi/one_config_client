require 'openssl'
require "base64"

module OneConfigClient
  module EncryptHelper

    ALGORITHM = "aes-128-cbc"

    def self.encode(data, key, iv)
      cipher = OpenSSL::Cipher.new(ALGORITHM)
      cipher.encrypt
      cipher.key = [key].pack("H*")
      cipher.iv  = [iv].pack("H*")
      data = cipher.update(data) + cipher.final
      Base64.encode64(data)
    end

    def self.decode(data, key, iv)
      data = Base64.decode64(data)
      cipher = OpenSSL::Cipher.new(ALGORITHM)
      cipher.decrypt
      cipher.key = [key].pack("H*")
      cipher.iv  = [iv].pack("H*")
      data = cipher.update(data) + cipher.final
      return data
    end
  end
end
