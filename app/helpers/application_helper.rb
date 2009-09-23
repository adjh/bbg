# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # set the titel for current page
  def title(page_title)  
    content_for(:title) do   
      "#{page_title} - 杯杯干,最健康的酒品社区网"  
    end  
  end   
  
  # set the description for current page  
  def description(page_description)  
    content_for(:description) do   
      "<meta name=\"description\" content=\"#{page_description}\" />\n"  
    end  
  end  
  
  # set the keywords for current page  
  def keywords(page_keywords)  
    content_for(:keywords) do   
      "<meta name=\"keywords\"  content=\"#{page_keywords}\" />\n"  
    end       
  end
  
  # set the stylesheet for current page  
  def css(page_css)  
    page_css.split(' ').each do |item|
      content_for(:css) do
        "<link href=\"/stylesheets/#{page_css}.css\" rel='stylesheet' type='text/css'/>\n"  
      end       
    end
  end
  
  # set the javascript for current page  
  def js(page_js)  
    page_js.split(' ').each do |item|
      content_for(:js) do
        "<script src=\"/javascripts/#{item}.js\" type=\"text/javascript\"></script>\n"       
      end
    end       
  end
  
  $HOURS = [['凌晨 0:00 ', '00:00'], ['凌晨 1:00 ', '1:00'], ['凌晨 2:00 ', '2:00'], ['凌晨 3:00 ', '3:00'],
           ['凌晨 4:00 ', '4:00'], ['凌晨 5:00 ', '5:00'], ['凌晨 6:00 ', '6:00'], ['上午 7:00 ', '7:00'],
           ['上午 8:00 ', '8:00'], ['上午 9:00 ', '9:00'], ['上午 10:00', '10:00'], ['上午 11:00', '11:00'], 
           ['上午 12:00', '12:00'], ['下午 1:00 ', '13:00'], ['下午 2:00 ', '14:00'], ['下午 3:00 ', '15:00'], 
           ['下午 4:00 ', '16:00'], ['下午 5:00 ', '17:00'], ['下午 6:00 ', '18:00'], ['晚上 7:00 ', '19:00'], 
           ['晚上 8:00 ', '20:00'], ['晚上 9:00 ', '21:00'], ['晚上 10:00', '21:00'], ['晚上 11:00', '23:00']]
  
  def current_namespace(tab, &block)
    namespace = tab.instance_variable_get('@builder').instance_variable_get('@namespace')
    block.call(tab) if controller.send(:tab_stack).member?(namespace.to_sym)
  end
  
end
