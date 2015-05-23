//不让该页面嵌入其他框架页面
window.onload = function initForm(){//登录界面不嵌入到任何子页面
	var loginName = getCookie('userphnoe');
	if(loginName && loginName != ''){
		document.getElementById('userphnoe').value = loginName;
	}
	
	//初始化焦点
	if(document.getElementById('userphnoe').value == ''){
		document.getElementById('userphnoe').focus();
	}else{
		document.getElementById('password').focus();
	}
};

//记录登录信息
function saveLoginInfo(){
	setCookie('userphnoe',document.getElementById('userphnoe').value,30);
}

/**
 * 获取当前页面的缩放比
 * document.body.style.zoom=$(window).width/640
 * @returns {Boolean}
 */
function doSubmit(){
	saveLoginInfo();
	document.forms[0].submit();
	
	return true;
}

//回车提交事件
function keyFunction(){	
	if( event.keyCode == 13 ){
		doSubmit();
	}
}

function setCookie(objName,objValue,objDays){//添加cookie 
  var str = objName + "=" + objValue; 
  if(objDays> 0){//为0时不设定过期时间，浏览器关闭时cookie自动消失 
    var date = new Date(); 
    var ms = objDays*24*3600*1000; 
    date.setTime(date.getTime() + ms); 
    str += "; expires=" + date.toGMTString(); 
  } 
  document.cookie = str; 
}

function getCookie(cookieName){//自定义函数    	
    var cookieString = document.cookie;    //获取cookie
    var start = cookieString.indexOf(cookieName + '=');//截取cookie的名
    if (start == -1)                         //若不存在该名字的 cookie
    return null;                            //返回空值
    start += cookieName.length + 1;                    
    var end = cookieString.indexOf(';', start);
    if (end == -1)                    //防止最后没有加“;”冒号的情况
    return cookieString.substring(start);//返回cookie值
    return cookieString.substring(start, end);//返回cookie值
}

/**
 * 用户注册
 */
  
  function dosunmit(){
	  alert(saveflag);
	  if(saveflag==false){
		  alert('电话号码无效，不能注册');
		  return;
	  }
	  var userphnoe=document.getElementById("userphnoe").value;
	  var password=document.getElementById("password").value;
	  alert(1);
	  var url='~/poral/doregister.do?userphnoe='+ userphnoe+'&password='+password;
	  window.location.href=$.utils.parseUrl(url);
  }

/**
 * 红包用户验证
 */
var saveflag=true;

function checkphnoe(value){
	alert(1);
	var exists = null;
	var yhdxdh="";
	$.dataservice("spring:redbackService.checkphnoe", {
				userphnoe : value,
		        yhdxdh : yhdxdh
			}, function(response) {
				exists = response;
			}, {
				async : false
			});
	if (exists) {
		saveflag=true;
		return {
			
			isError : false,
			errorInfo : "电话号码正确"
		};
	} else {
		saveflag=false;
		return {
			
			isError : true,
			errorInfo : "电话号码无效"
		};
	}
}