#!/usr/bin/env ruby

class Chef
  class Handler
    class Syslog < Chef::Handler

      def report
        if run_status.failed?
          `logger -p user.err 'Chef Complete: status=failed elapsed_time=#{run_status.elapsed_time}'`
        else
          `logger -p user.info 'Chef Complete: status=success elapsed_time=#{run_status.elapsed_time}'`
        end
      end

    end
  end
end
