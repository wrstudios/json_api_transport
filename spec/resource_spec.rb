require 'spec_helper'

describe JsonApiTransport::Resource do

  context 'Method definitions' do
    it 'defines a base_url method' do
      expect { JsonApiTransport::Resource.base_url "example.com" } .to_not raise_error
    end
    
    it 'defines an auth method' do
      expect { JsonApiTransport::Resource.auth("example.com", 'args')} .to_not raise_error
    end

    it "defines a resource name method" do
      expect { JsonApiTransport::Resource.resource_name("exmaples")} .to_not raise_error
    end
  end
  
  context 'Building URLS' do
    let(:base_url) {'http://www.example.com/v1'}
    let(:resource) {JsonApiTransport::Resource}

    it 'builds correctly with only two fragments' do
      resource.base_url(base_url)
      formatted_url = "http://www.example.com/v1/articles/1"
      expect(resource.generate_url('articles', 1)).to eq formatted_url
    end

    it 'builds a more complex url' do
      resource.base_url(base_url)
      formatted_url = "#{base_url}articles/1/comments/2"
      expect(resource.generate_url('articles', 1, 'comments', 2)).to eq formatted_url
    end
  end

  context "::find" do
    let(:base_url) {'http://www.example.com/v1'}
    let(:resource) {JsonApiTransport::Resource}

    it "generates a url and forwards to TransportCall" do
      resource.base_url(base_url)
      resource.resource_name("articles")
      trans = double("TransportCall")
      allow(trans).to receive(:do_request)

      expect(JsonApiTransport::TransportCall).to receive(:new).with(:get, "http://www.example.com/v1/articles/1", {}).and_return(trans)

      resource.find(1)
    end
  end
end
