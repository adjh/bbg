# Tab extends on TabOnRails plugin
class MenuTabBuilder < TabsOnRails::Tabs::Builder
  def tab_for(tab, name, options, item_options = {})
    item_options[:class] = 'current' if current_tab?(tab)
    @context.content_tag(:li, item_options) do
      @context.link_to(name, options)
    end
  end
end
