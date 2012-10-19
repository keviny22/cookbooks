require 'uri'

module Papertrail
  class Group

    attr_reader :name

    def initialize(name, client)
      @client = client
      @name   = name
    end

    def exists?
      data  = @client.get_request('/groups.json')
      group = data.select { |g| g['name'] == name }
      group.any?
    end

    def create(params=nil)
      @client.post_request '/groups.json', build_create_params(params)
      self
    end

    private
    def build_create_params(params)
      params.merge!({ 'name' => name })

      param_data = params.map { |k,v| ["group[#{k}]", v] }

      Hash[*param_data.flatten]
    end

  end
end
