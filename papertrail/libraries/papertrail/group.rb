require 'uri'

module Papertrail
  class Group

    attr_reader :name

    def initialize(name)
      @name = name
    end

    def exists?
      http                          = Net::HTTP.new api_host
      request                       = Net::HTTP::Get.new groups_url
      request['X-Papertrail-Token'] = node['papertrail']['api_token']

      response                      = JSON.parse(http.request(request).body)
      group                         = response.select { |g| g['name'] == name }
      group.any?
    end

    def create(name, system_wildcard)
      http                          = Net::HTTP.new api_host
      request                       = Net::HTTP::Post.new groups_url
      request['X-Papertrail-Token'] = node['papertrail']['api_token']
      request.set_form_data 'name'            => name,
                            'system_wildcard' => system_wildcard
      http.request request
    end

    private
    def api_endpoint
      node['papertrail']['api_endpoint']
    end

    def api_host
      URI(node['papertrail']['api_endpoint']).host
    end

    def groups_url
      URI.join api_endpoint, 'groups.json'
    end

  end
end
