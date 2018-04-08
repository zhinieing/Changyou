  function openLogin(){
  	var logForm=$("#win");
   var newHeight=($(window).height())/2+$(document).scrollTop()-logForm.css('height')/2;
    logForm.css('display','block');
    logForm.css('top',newHeight);
   var hideobj=document.getElementById("hidebg");
   hidebg.style.display="block";  //显示隐藏层
   hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
}
function closeLogin(){
	 document.getElementById("hidebg").style.display="none";
   document.getElementById("win").style.display="none";
}

	function openRegister(){
		document.getElementById("win").style.display="none";
		// document.getElementById("register").style.display="block";
		var logForm=$("#register");
   var newHeight=($(window).height())/2+$(document).scrollTop()-logForm.css('height')/2;
    logForm.css('display','block');
    logForm.css('top',newHeight);
	}
	function closeRegister(){
		 document.getElementById("hidebg").style.display="none";
   document.getElementById("register").style.display="none";
}