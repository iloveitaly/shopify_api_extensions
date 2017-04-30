require "shopify_api_extensions/version"
require 'shopify_api'

Dir[File.join(File.dirname(__FILE__), "shopify_api_extensions/**/*.rb")].each { |f| require f }

module ShopifyAPIExtensions

end
