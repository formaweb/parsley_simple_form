class MockController
  attr_writer :action_name

  def named_routes
    self
  end

  def url_for(*args)
    "http://example.com"
  end

  def action_name
    defined?(@action_name) ? @action_name : "edit"
  end

  def hash_for_company_path(*); end
end