ShopifyAPI::Connection.class_eval do
  alias_method :shopify_request, :request

  def request(*args)
    network_retry = 0
    network_limit = 10

    rate_limit_retry = 0
    rate_limit_limit = 30

    begin
      shopify_request(*args)
    rescue Exception => e
      exceptions_to_retry = [
        ActiveResource::ClientError,
        Errno::ECONNRESET,
        Errno::ETIMEDOUT,
        Errno::EHOSTUNREACH,
        EOFError,
        Zlib::BufError,
        SocketError,
        ActiveResource::SSLError,
        # NOTE represents only 500x errors
        ActiveResource::ServerError
      ]

      if !exceptions_to_retry.include?(e.class)
        raise
      end

      if e.class == ActiveResource::ClientError && e.message =~ /429/ && e.message =~ /Too Many Requests/
        if rate_limit_retry > 0 && rate_limit_retry % 10 == 0
          puts "Shopify Rate Limit Error Encountered"
        end

        if rate_limit_retry >= rate_limit_limit
          raise
        else
          rate_limit_retry += 1
          sleep(rate_limit_retry)
          retry
        end
      elsif e.class == ActiveResource::ClientError
        raise
      end

      if network_retry >= network_limit
        raise
      else
        network_retry += 1
        sleep(network_retry)
        retry
      end
    end
  end
end
