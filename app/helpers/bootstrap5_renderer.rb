class Bootstrap5Renderer < WillPaginate::ActionView::LinkRenderer
  def container_attributes
    { class: 'pagination justify-content-center' }
  end

  def page_number(page)
    classes = ['page-item']
    classes << 'active' if page == current_page
    classes << 'first' if page == 1
    classes << 'last' if page == total_pages

    tag(:li, link(page, page == current_page ? "#" : url(page), class: 'page-link'), class: classes.join(' '))
  end

  def gap
    tag(:li, link('&hellip;'.html_safe, "#", class: 'page-link'), class: 'page-item disabled')
  end
end
