module ApplicationHelper

  def icon(name, color=" ")
    raw("<div class='btn btn-"+color+"'><i class='bi bi-" + name + "'></i></div>")
  end
end
