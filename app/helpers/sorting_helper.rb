module SortingHelper
  def sortable(column, title = nil)
    title ||= column.titleize + " <i class='fa fa-sort'></i>"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title.html_safe, {:sort => column, :direction => direction}
  end
end
