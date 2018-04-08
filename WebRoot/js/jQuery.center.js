jQuery.fn.center = function(){

this.css({

"position":"absolute",

"top":(($(window).height()-this.height())/2+$(window).scrollTop())+"px"

// "left":(($(window).width()-this.width())/2+$(window).scrollLeft())+"px"

});

return this;

}