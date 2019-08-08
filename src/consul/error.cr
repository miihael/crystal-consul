require "http/client"

module Consul
  module Error
    class Error < Exception; end

    class ApiError < Error
      getter resp

      def initialize(@resp : HTTP::Client::Response)
        super(build_error_message)
      end

      private def build_error_message
        "Server responded with code #{resp.status_code}, message: " \
        "#{resp.body}" 
      end

    end

    class BadRequest < ApiError; end
    class NotFound < ApiError; end

  end
end