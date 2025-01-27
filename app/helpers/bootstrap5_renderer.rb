class Bootstrap5Renderer < WillPaginate::ActionView::LinkRenderer
  def container_attributes
    { class: 'pagination justify-content-center' }
  end

  def page_number(page)
    if page == current_page
      tag(:li, link(page, "#", class: 'page-link'), class: 'page-item active')
    else
      tag(:li, link(page, url(page), class: 'page-link'), class: 'page-item')
    end
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text, url(page), class: 'page-link'), class: "page-item #{classname}")
    else
      tag(:li, link(text, "#", class: 'page-link disabled'), class: "page-item disabled #{classname}")
    end
  end

  def gap
    tag(:li, link('&hellip;'.html_safe, "#", class: 'page-link'), class: 'page-item disabled')
  end
end
