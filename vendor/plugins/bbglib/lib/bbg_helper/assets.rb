# BBGlib
# create by Raecoo

module BbgHelper
  
  module  Assets
  
    # set the titel for current page
    def title(page_title)  
      content_for(:title){"#{page_title} | "}
    end   
  
    # set the description for current page  
    def description(page_description)  
      content_for(:description) do   
        "<meta name=\"description\" content=\"#{page_description}\" />\n"  
      end  
    end  
  
    # set the keywords for current page  
    def keywords(page_keywords)  
      content_for(:keywords){"<meta name=\"keywords\"  content=\"#{page_keywords}\" />\n"}       
    end
  
    # load the stylesheet for current page  
    def css(page_css)  
      page_css.split(' ').each do |item|
        content_for(:css) do
          "<link href=\"/stylesheets/#{page_css}.css\" rel='stylesheet' type='text/css'/>\n"  
        end       
      end
    end
  
    # load the javascript for current page  
    def js(page_js)  
      page_js.split(' ').each do |item|
        content_for(:js) do
          "<script src=\"/javascripts/#{item}.js\" type=\"text/javascript\"></script>\n"       
        end
      end       
    end
    
    # return the gender style class name
    def gender_color(sex)
      sex.to_i == 0 ? 'female' : 'male'
    end
  
  end

end

