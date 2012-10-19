require 'uri'

module Papertrail
  class Client

    def initialize(api_endpoint, api_token)
      @api_endpoint = api_endpoint
      @api_token    = api_token
    end

    def get_request(url)
      request                       = Net::HTTP::Get.new api_url_path(url)
      request['X-Papertrail-Token'] = api_token
      JSON.parse(http_client.request(request).body)
    end

    def post_request(url, data)
      request                       = Net::HTTP::Post.new api_url_path(url)
      request['X-Papertrail-Token'] = api_token
      request.set_form_data data
      JSON.parse(http_client.request(request).body)
    end

    private
    attr_reader :api_endpoint, :api_token

    def api_host
      URI(api_endpoint).host
    end

    def api_url_path(url)
      "#{URI(api_endpoint).path}#{url}"
    end

    def http_client
      return @http_client if @http_client

      @http_client = Net::HTTP.new api_host, 443
      @http_client.tap do |client|
        http.use_ssl     = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

  end
end
