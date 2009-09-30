# Tab extends on TabOnRails plugin
class MenuTabBuilder < TabsOnRails::Tabs::Builder
  
  def tab_for(tab, name, options)
    @context.content_tag(:li, current_tab?(tab) ? {:class => "current"} : nil) do
      @context.link_to(name, options)
    end
  end
  
  
end
