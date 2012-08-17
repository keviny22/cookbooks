class Chef
  class Handler
    class Campfire < Chef::Handler

      def initialize(subdomain, token, room, message)
        @subdomain = subdomain
        @token     = token
        @room      = room
        @message   = message
        @base_cmd  = "curl -s -m 60 -k -u #{@token}:X -H 'Content-Type: application/json'"
        @url       = "https://#{@subdomain}.campfirenow.com/room/#{@room}/speak.json"
      end

      def message_body(message)
        json = { 'message' => 
                 { 'body' => message.to_s }
               }
        json.to_json
      end

      def report
        message   = "-d '#{message_body @message}'"
        exception = "-d '#{message_body run_status.formatted_exception}'"
        `#{@base_cmd} #{message} #{@url}`
        `#{@base_cmd} #{exception} #{@url}`
      end

    end
  end
end
