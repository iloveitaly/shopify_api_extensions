ShopifyAPI::Base.class_eval do
  def self.list(params = {})
    find(:all, params: params)
  end

  def self.auto_paging_each(opts = {})
    opts[:limit] ||= 50
    current_page = opts[:page] || 1
    records = []
    record_found = true
    while record_found
      record_found = false
      self.list(opts.merge(page: current_page)).each do |record|
        record_found = true
        records << record
        yield(record) if block_given?
      end
      current_page += 1
    end
    records
  end
end
