ShopifyAPI::Product.class_eval do
  def variants
    ShopifyAPI::Variant.auto_paging_each(product_id: self.id)
  end
end
