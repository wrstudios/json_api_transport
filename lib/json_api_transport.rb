require 'active_support'
require 'active_support/core_ext'

require "json_api_transport/version"

module JsonApiTransport
  class Resource
    def self.base_url(base_url)
      @base_url = base_url
      @base_url << '/' unless @base_url.last == '/'
    end

    def self.auth(strategy, *args)
      @auth_strategy = strategy
      @auth_args = args
    end

    def self.find(id, params={})
      url = generate_url("articles", 1)
      transport_call = TransportCall.new(:get, url, params)
      transport_call.do_request
    end

    def self.generate_url(*fragments)
      "#{@base_url}" + fragments.join("/")
    end

  end

  class TransportCall
    def initialize(verb, url, params)
      @verb = verb
      @url = url
      @params = params
    end

    def do_request
      
      
    end

  end
end

