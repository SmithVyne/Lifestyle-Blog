module ArticlesHelper
  def votesnotnil
    url_for(@max.image) if @max
  end

  def renderhead
    render 'head_inside' if @max
  end
end
