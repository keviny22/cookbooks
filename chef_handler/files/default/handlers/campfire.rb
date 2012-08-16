class Chef
  class Handler
    class Campfire < Chef::Handler

      def initialize(subdomain, token, room, message)
        @subdomain = subdomain
        @token = token
        @room = room
        @message = message
      end

      def report
        base_cmd = "curl -k -u #{@token}:X -H 'Content-Type: application/json' -d"
        message = " \"{'message':{'body':'#{run_status.formatted_exception}'}}\" "
        url = "https://#{@subdomain}.campfirenow.com/room/#{@room}/speak.json"
        cmd = "#{base_cmd} #{@message} #{url}" 
        `#{cmd}`
      end

    end
  end
end
