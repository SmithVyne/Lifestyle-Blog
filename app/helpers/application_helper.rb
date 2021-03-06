module ApplicationHelper
  def notices?
    if flash[:success]
      notices = flash[:success]
      render 'layouts/notices', notices: notices, design: 'success'
    elsif flash[:errors]
      notices = flash[:errors]
      render 'layouts/notices', notices: notices, design: 'danger'
    end
  end

  def vote_button(article)
    if current_user.voted?(article)
      content_tag(:span, 'Voted', class: %w[badge badge-warning])
    else
      link_to 'Vote', "/articles/#{article.id}/vote", class: %w[badge badge-success]
    end
  end

  def categories?
    render 'categories' if @categories
  end

  def articles?
    render 'articles' if @articles
  end

  def checkboxes(article)
    control = (@articles.index(article) + 1) % 4
    a = render 'text', article: article
    b = render 'image', article: article
    if control.zero? || control == 3
      a + b
    else
      b + a
    end
  end

  def hasarticles?(cat)
    render 'cat_support', category: cat if cat.articles.any?
  end
end
