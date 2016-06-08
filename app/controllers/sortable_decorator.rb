module SortableDecorator
  attr_accessor :sort_param, :sort_model

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    @sort_model.column_names.include?(params[:sort]) ? params[:sort] : @sort_param
  end

end