ShopifyAPI::Base.class_eval do
  def self.list(params = {})
    find(:all, params: params)
  end

  def self.auto_paging_each(opts = {})
    opts[:limit] ||= 50
    page_limit = opts[:limit]

    total_count = self.count(opts)
    pages = total_count/page_limit + 1
    current_page = opts[:page] || 1
    records = []

    while current_page <= pages
      self.list(opts.merge(page: current_page)).each do |record|
        records << record

        yield(record) if block_given?
      end

      # TODO should keep incrementing until no results are returned instead of
      #      relying on the page count when the requests were initiated

      current_page += 1
    end

    records
  end
end
