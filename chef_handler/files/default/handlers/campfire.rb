class Chef
  class Handler
    class Campfire < Chef::Handler

      def initialize(subdomain, token, room, message)
        @subdomain = subdomain
        @token     = token
        @room      = room
        @message   = message
      end

      def report
        base_cmd = "curl -s -m 60 -k -u #{@token}:X -H 'Content-Type: application/json'"
        body     = "-d \"{'message':{'body':'#{@message} #{run_status.formatted_exception}'}}\" "
        url      = "https://#{@subdomain}.campfirenow.com/room/#{@room}/speak.json"
        cmd      = "#{base_cmd} #{body} #{url}" 
        `#{cmd}`
      end

    end
  end
end
