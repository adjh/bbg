module NavsTabBuilder

  class GlobalTabs < TabsOnRails::Tabs::Builder
    def tab_for(tab, name, options)
      nav_tab = current_tab?(tab) ? {:class => "active", :id => "nav-#{tab}"} : {:id => "nav-#{tab}"}
      @context.content_tag(:li, nav_tab) do
        @context.link_to(name, options, :class => current_tab?(tab) ? "active" : nil)
      end
    end
  end
  
  class AdminTabs < TabsOnRails::Tabs::Builder
    def tab_for(tab, name, options)
      @context.content_tag(:li) do
        @context.link_to(name, options, :class => current_tab?(tab) ? "active" : nil)
      end
    end
  end
  
end