require 'uri'

module Papertrail
  class Client

    def initialize(api_endpoint, api_token)
      @api_endpoint = api_endpoint
      @api_token    = api_token
    end

    def get_request(url)
      full_url = URI.join api_endpoint, url
      request                       = Net::HTTP::Get.new full_url
      request['X-Papertrail-Token'] = api_token
      JSON.parse(http.request(request).body)
    end

    def post_request(url, data)
      http                          = Net::HTTP.new api_host
      request                       = Net::HTTP::Post.new url
      request['X-Papertrail-Token'] = api_token
      request.set_form_data data
      JSON.parse(http.request(request).body)
    end

    private
    attr_reader :api_endpoint, :api_token

    def api_host
      URI(api_endpoint).host
    end

    def http_client
      @http_client ||= Net::HTTP.new api_host
    end

  end
end
