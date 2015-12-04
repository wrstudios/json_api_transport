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

    def self.resource_name(name)
      @resource_name = name
    end

    def self.resource
      @resource_name || self.name.demodulize.downcase.pluralize
    end

    def self.generate_url(*fragments)
      "#{@base_url}" + fragments.join("/")
    end

    def self.find(id, params={})
      url = generate_url(resource, id)
      transport_call = TransportCall.new(:get, url, params)
      transport_call.do_request
    end

  end
end
