module ApplicationHelper

  def vote_button(article)
    if current_user.voted?(article)
      content_tag(:span, "Voted", class: ["badge", "badge-warning"])
    else
      content_tag(:span, "Vote", class: ["badge", "badge-success"])
    end
  end
end
