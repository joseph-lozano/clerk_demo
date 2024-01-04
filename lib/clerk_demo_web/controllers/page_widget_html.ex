defmodule ClerkDemoWeb.PageWidgetHTML do
  use ClerkDemoWeb, :html

  embed_templates "page_widget_html/*"

  @doc """
  Renders a page_widget form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def page_widget_form(assigns)
end
