/**
 * 处理保存按钮动作
 */
function doSave() {
	/*alert(saveuser);*/
	/*if(saveuser==false){
		alert('用户名无效，不能保存');
		return false;
	}*/
	
	/*alert(saveflag);*/
	if(saveflag==false){
		alert('激活码无效，不能保存');
		return false;
	}
	
	var valInfo = $.validation.validate("#SEC_USER_FOMR");
	
	if (valInfo.isError)
		
		
		var user = $('#SEC_USER_FOMR').toJson();

	$.dataservice("spring:exchangehbbService.saveUser", user, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});	
	
}
/**
 * 验证密码
 * @return
 */
function checkNewPassword() {
	var patternStr = /^[0-9]{6,40}$/;
	if (patternStr.test($F('password'))) {
		return false;
	}
	var len = $F('password').length;
	return len >= 6 && len <= 40;
}

/**
 * 验证激活码的唯一性
 */
var saveflag=true;

function check(value){
	var exists = null;
	var yhdxdh="";
	$.dataservice("spring:YHDLservice.checkJHM", {
		        userjhm : value,
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
			errorInfo : "激活码正确"
		};
	} else {
		saveflag=false;
		
		alert('激活码无效');
	}
}

/**
 * 验证用户名的唯一性
 * @param value
 * @return
 *//*
var saveuser=true;
function checkuser(value){
	var exist = null;
	var yhdxdh="";
	$.dataservice("spring:YHDLservice.checkuser", {
		        username : value,
		        yhdxdh : yhdxdh
			}, function(response) {
				exist = response;
			}, {
				async : true
			});
	if (exist) {
		saveuser=true;
		alert('用户名可用');
	} else {
		saveuser=false;
		
		alert('用户名无效');
	}
}*/

/**
* 获取异步通信对象 XMLHttpRequest
*/
function getXMLHttpRequest(){
	
    if(window.ActiveXObject){
   
    	alert('laj');
        // ie7+
        xmlHttp = new ActiveXObject(Microsoft.XMLHTTP);
    
    }else if(window.XMLHttpRequest){
        // w3c 标准
        xmlHttp = new XMLHttpRequest();
    }else{
        // ie5,ie6
        xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    } 
    return xmlHttp;
}
 
/**
* 结果处理器
*/
function handler(){
    if(xmlHttp.readystate == 4){
        // 服务器返回200表示正常处理请求
        if(xmlHttp.statu == 200){
            // 是否是true由Servlet的返回值决定, request.getWriter().print("true");
            if(xmlHttp.ResponseText.trim() == "true"){
                alert("userName is exists!");
            }else{
                alert("userName is OK");
            }
        }else{
            // 服务器响应代码不是200, 表示Servlet处理请求时出现异常
            alert("server error, StatuCode:"+xmlHttp.statu);
        }
    }
}
 
/**
* 事件触发函数
* @param userName 被检测用户名
* @param URL 用于处理异步通信的Servlet的URL地址
*/
function checkUserName(username, url){
	
   // url示例: /ObjName/servlet/CheckUserName
   // 需要把参数带给Servlet
   url = url + "?username=" + username;
   
   // 获取xmlHttp
   var xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
   
   // 设置异步通信的结果处理器函数, 结果回调函数 
   xmlHttp.readystateonchange = handler;
   
   // 开启异步通信连接
   xmlHttp.open("GET", url, true);
   alert('测试');
   // 向Servlet发起请求
   xmlHttp.send(null);
}
