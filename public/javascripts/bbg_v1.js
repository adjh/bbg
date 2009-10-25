
// 
function auto_resize_img(maxWidth,maxHeight,objImg){  
  if (typeof(objImg)=='string'){  
    objImg = $(objImg);  
  }  
  var img = new Image();  
  img.onload = function(){  
    var hRatio;  
    var wRatio;  
    var Ratio = 1;  
    var w = img.width;  
    var h = img.height;  
    wRatio = maxWidth / w;  
    hRatio = maxHeight / h;  
    wRatiowRatio = wRatio>1?1:wRatio;  
    hRatiohRatio = hRatio>1?1:hRatio;  
    if (maxWidth ==0 && maxHeight==0){  
      Ratio = 1;  
      }else if (maxWidth==0){//  
        if (hRatio<1) Ratio = hRatio;  
      }else if (maxHeight==0){  
        if (wRatio<1) Ratio = wRatio;  
      }else {  
        Ratio = (wRatio<=hRatio?wRatio:hRatio);  
      }  
      if (Ratio<1){  
        ww = w * Ratio;  
        hh = h * Ratio;  
      }  
      objImg.height = h;  
      objImg.width = w;  
      this.onload = function(){}  
  }  
  img.src = objImg.src;  
}
