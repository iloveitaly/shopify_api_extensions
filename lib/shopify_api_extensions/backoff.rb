ShopifyAPI::Connection.class_eval do
  alias_method :shopify_request, :request

  def request(*args)
    count = 0
    limit = 10

    begin
      count += 1
      shopify_request(*args)
    rescue Exception => e
      exceptions_to_retry = [
        ActiveResource::ClientError,
        Errno::ECONNRESET,
        Errno::ETIMEDOUT,
        Errno::EHOSTUNREACH,
        EOFError,
        Zlib::BufError,
        SocketError
      ]

      if !exceptions_to_retry.include?(e.class)
        raise
      end

      # TODO look at code instead of static string? This is brittle
      if count >= limit || (e.class == ActiveResource::ClientError && e.message != "Failed.  Response code = 429.  Response message = Too Many Requests.")
        raise
      else
        sleep(count)
        retry
      end
    end
  end
end
