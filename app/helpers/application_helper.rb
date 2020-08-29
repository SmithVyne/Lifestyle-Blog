module ApplicationHelper

  def vote_button(article)
    if current_user.voted?(article)
      content_tag(:span, "Voted", class: ["badge", "badge-warning"])
    else
      content_tag(:span, "Vote", class: ["badge", "badge-success"])
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
    if control == 0 || control == 3
      a + b
    else
      b + a
    end
  end
end
