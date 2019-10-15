module ApplicationHelper
  def toggle_link
    view = params[:view]
    filter = params[:filter]

    other_view = 'map' if view == 'list'

    fixpoints_path(view: other_view || 'list', filter: params[:filter])
  end
end
