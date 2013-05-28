class CompanyPresenter < Presenter
  def website_url
    UrlValidator.normalize(website).to_s
  end

  def website_host
    UrlValidator.normalize(website).host
  end

  def linked_name
    case
    when name? && website?
      t.link_to name, website_url
    when name? && !website?
      name
    when !name? && website?
      t.link_to website_host, website_url
    end
  end
end
