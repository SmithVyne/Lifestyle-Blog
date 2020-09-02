module ArticlesHelper
  def votesnotnil
    url_for(@max.image) if @max
  end

  def renderhead
    render 'head_inside' if @max
  end

  def optionfields(form)
    form.select :category_id, @categories.map { |c| [c.name, c.id] }, 
    {
      selected: "",
      disabled: "",
      prompt: 'Choose a category'
    }, class: ["custom-select", "custom-select-lg", "mb-3"]
  end
end
