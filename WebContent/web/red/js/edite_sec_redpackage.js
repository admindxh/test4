function loadData(grid) {
	grid.doSearch();
}

function doOnBeforeMenuRender(grid, rowData, menuItems) {
	var status = rowData.ACCOUNT_STATUS;
	switch (status) {
		case 'disabled' :
			menuItems.showItem("enabled_user");
			menuItems.hideItem("disabled_user");
			break;
		case 'enabled' :
			menuItems.showItem("disabled_user");
			menuItems.hideItem("enabled_user");
			break;
	}
	return true;
}
  
	function dosavedh(grid, rowData, keyData){
		var valInfo = $.validation.validate("#SEC_HBB_FOMR");
		
		if (valInfo.isError)
		return;
		var hbjj = $('#SEC_HBB_FOMR').toJson();
		var exists=null;
		$.dataservice("spring:exchangehbbService.toRMBsavedh", hbjj, function(response) {
					$.dialogReturnValue(true);
					$(document).dialogClose();
					exists = response;
					location.replace(document.referrer);//返回并刷新
				}, {
					async : false
				});	
		if (exists) {
			saveflag=true;
			alert("兑换成功！");
			return {
				isError : false,
				errorInfo : "兑换成功！"
			};
		} else {
			saveflag=false;
			alert('兑换失败,请重新输入!');
		}
	}
/**
 * 前台调用方法
 * 红包基金兑换
 */
	function toRMBDH(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/doRMBDH.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
/**
 * 用户充值保存方法
 * @date 2015/5/24
 * @param grid
 * @param rowData
 * @param keyData
 * @returns {___anonymous975_1032}
 */
	function mychongzhi(grid, rowData, keyData){
		var valInfo = $.validation.validate("#SEC_HBB_FOMR");
		
		if (valInfo.isError)
		return;
		var hbjj = $('#SEC_HBB_FOMR').toJson();
		var exists=null;
		$.dataservice("spring:exchangehbbService.dosaveChongzhi", hbjj, function(response) {
					$.dialogReturnValue(true);
					$(document).dialogClose();
					exists = response;
					location.replace(document.referrer);//返回并刷新
				}, {
					async : false
				});	
		if (exists) {
			saveflag=true;
			alert("充值成功！");
			return {
				isError : false,
				errorInfo : "红包基金转账成功！"
			};
		} else {
			saveflag=false;
			alert('充值失败,请重新输入!');
		}
	}
/**
 * 前台调用方法
 * 用户充值
 */
	function chongzhi(){
		
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/chongzhi.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
/**
 * @param 前台调用方法
 * @param 我的零钱
 */
	function myMoney(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/myLinqian.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
/**
 * 前台用户提现调用方法
 * @param grid
 * @param rowData
 * @param keyData
 * @returns {___anonymous998_1055}
 */
	function hbtixian(grid, rowData, keyData){
		var valInfo = $.validation.validate("#SEC_HBB_FOMR");
		
		if (valInfo.isError)
		return;
		var hbjj = $('#SEC_HBB_FOMR').toJson();
		var exists=null;
		$.dataservice("spring:exchangehbbService.deleteProceeds", hbjj, function(response) {
					$.dialogReturnValue(true);
					$(document).dialogClose();
					exists = response;
					location.replace(document.referrer);//返回并刷新
				}, {
					async : false
				});	
		if (exists) {
			saveflag=true;
			alert("提取红包收益成功！");
			return {
				isError : false,
				errorInfo : "红包基金转账成功！"
			};
		} else {
			saveflag=false;
			alert('提取红包收益失败,请重新输入!');
		}
	}
	/**
	 * 财务中心跳转到红包提现页面
	 */
	function traRMBTX(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/traRMBTX.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}

	function cardclick(grid, rowData, keyData){
	  var phone=document.getElementById("userphnoe").value;
	  var iphone=/^(13[0-9]{9})|(15[89][0-9]{8})|(18[0-9]{9})$/;
	  
	  if((iphone.test(phone))){
			 
		  }else{   
	          	alert("请重新输入账号！");
	          	return false;
			  }
	  
	}
	function excRMB(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/excRMB.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
	function hbjjdelete(grid, rowData, keyData){
		var valInfo = $.validation.validate("#SEC_HBB_FOMR");
		
		if (valInfo.isError)
		return;
		var hbjj = $('#SEC_HBB_FOMR').toJson();
		var exists=null;
		$.dataservice("spring:exchangehbbService.getexcRMBZH", hbjj, function(response) {
					$.dialogReturnValue(true);
					$(document).dialogClose();
					exists = response;
					/*alert("红包基金转账成功！");*/
					location.replace(document.referrer);//返回并刷新
				}, {
					async : false
				});	
		if (exists) {
			saveflag=true;
			alert("红包基金转账成功！");
			return {
				isError : false,
				errorInfo : "红包基金转账成功！"
			};
		} else {
			saveflag=false;
			alert('红包基金转账转账失败,请重新输入!');
		}
	}
	/**
	 * 红包币转账
	 * @param grid
	 * @param rowData
	 * @param keyData
	 */
	function excB(grid, rowData, keyData){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/excB.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
	
	function hbbexcB(grid, rowData, keyData){
		var valInfo = $.validation.validate("#SEC_HBB_FOMR");
		
		if (valInfo.isError)
		return;
		var user = $('#SEC_HBB_FOMR').toJson();
		var exists = null;
		$.dataservice("spring:exchangehbbService.savehbbzz", user, function(response) {
					$.dialogReturnValue(true);
					$(document).dialogClose();
					exists = response;
					
					location.replace(document.referrer);//返回并刷新
				}, {
					async : false
				});	
		if (exists) {
			saveflag=true;
			alert("红包币转账成功！");
			return {
				isError : false,
				errorInfo : "红包币转账成功！"
			};
		} else {
			saveflag=false;
			alert('红包币转账转账失败,请重新输入!');
		}
		
	}
	/**
	 * 购买红包币
	 */
	function byhbb(grid, rowData, keyData){
		
			if(saveflag==false){
				alert('账号无效，不能保存');
				return false;
			}
			var valInfo = $.validation.validate("#SEC_HBB_FOMR");
			
			if (valInfo.isError)
			return;
			var user = $('#SEC_HBB_FOMR').toJson();
			var exists = null;
			$.dataservice("spring:exchangehbbService.getflager", user, function(response) {
						$.dialogReturnValue(true);
						$(document).dialogClose();
						exists = response;
						location.replace(document.referrer);//返回并刷新
					}, {
						async : false
					});	
			if (exists) {
				saveflag=true;
				alert("购买红包币成功！");
			} else {
				saveflag=false;
				alert('购买红包币失败,请重新输入!');
			}
			
		}
	
	/**
	 * 验证激活码的唯一性
	 */
	var saveflag=true;

	function checks(value){
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
				errorInfo : "账号正确"
			};
		} else {
			
			saveflag=false;
			alert('账号无效,请重新输入!');
		}
	}
	
	function buyB(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/buyB.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
	/**
	 * 红包金额记录
	 */
	function record(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/exchage/record.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}

	/**
	 * 登陆财务中心
	 */
	function center(obj){
		var id=null;
		if(obj){
			id=obj.id;
			alert(id);
			if(id=="center"){
				var url='~/exchage/center.do?id='+id;
				window.location.href=$.utils.parseUrl(url);
			}
		}	
	}

	/**
	 * 判断用户是点击了派红包，还是抢红包
	 * @param obj
	 */
	function qianghh(obj) {
		var id=null;
		if(obj){
			id=obj.id;
			
			if(id=="2"){
				var path='~/poral/getValue1.do?id='+id;
				window.location.href=$.utils.parseUrl(path);
			}
		}
		var url='~/poral/getValue2.do?id='+id;
		window.location.href=$.utils.parseUrl(url);	
	}
/**
 * 我收到的红包
 * @param grid
 * @param rowData
 * @param keyData
 */
	
	function myredpackge(){
		var valInfo = $.validation.validate("#SEC_RECEIVED_FOMR");
		if (valInfo.isError)
			return;

		var putong = $('#SEC_RECEIVED_FOMR').toJson();

		$.dataservice("spring:receivedService.dosave", putong, function(response) {
					$.dialogReturnValue(true);
					$(document).dialogClose();
					
					var id=document.getElementById("yhdxdh").value;
					var url='~/received/receiveMyred.do?id='+id;
					window.location.href=$.utils.parseUrl(url);
				});
	}

	/**
	 * 查看用户收到的红包
	 */
	function myReccieve(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/received/receiveMyred.do?id='+id;
		window.location.href=$.utils.parseUrl(url);
	}
	/**
	 * 查看用户我发送的红包
	 */
	function mySend(){
		var id=document.getElementById("yhdxdh").value;
		var url='~/received/mysend.do?yhdxdh='+id;
		window.location.href=$.utils.parseUrl(url);
	}
/**
 * ajax异步请求  提交登陆
 */

  function ajaxs(){
	  alert("进来了");
	      $(document).ready($("#login").click(function() {     
		        $.ajax({     
		            //要用post方式      
		            type: "Post",     
		            //方法所在页面和方法名      
		            url: "/registers",
		            data:"{'userphnoe':'userphnoe','password':'123'}",
		            contentType: "application/json; charset=utf-8",     
		            dataType: "json",     
		            success: function(data) {     
		                //返回的数据用data.d获取内容      
		                alert("成功"); 
		                $.dialogReturnValue(true);
						$(document).dialogClose();
		            },     
		            error: function(err) {  
		            	alert("失败");
		                alert(err);     
		            }     
		        });     
		    
		        //禁用按钮的提交      
		        return false;     
		    })
		    );
		       
  }
  

  
  
  
/**
 * 塞钱进红包
 * 普通红包
 */
function doinserthb() {
	var valInfo = $.validation.validate("#SEC_PUTONG_FOMR");
	if (valInfo.isError)
		return;

	var putong = $('#SEC_PUTONG_FOMR').toJson();

	$.dataservice("spring:redpackageService.insertputong", putong, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
				
				alert("操作成功！");
				location.replace(document.referrer);//返回并刷新
			});
}

/**
 * 群红包
 * 塞钱进红包方法
 */
function doSavequnfa(grid, rowData, keyData) {
	var valInfo = $.validation.validate("#SEC_QUNFA_FOMR");
	
	if (valInfo.isError)
		return;

	var qunfa = $('#SEC_QUNFA_FOMR').toJson();
	
	$.dataservice("spring:redpackageService.insertLssue", qunfa, function(response) {
		
				$.dialogReturnValue(true);
				$(document).dialogClose();
				alert("操作成功！");
				location.replace(document.referrer);//返回并刷新
			});
}

	window.onbeforeunload = function(){
	var n = window.event.screenX - window.screenLeft;
	var b = n > document.documentElement.scrollWidth-20;
	if(b && window.event.clientY < 0 || window.event.altKey){
		alert("是关闭而非刷新");
		window.event.returnValue = ""; //这里可以放置你想做的操作代码
		}
	}

//抢红包
function qianghb(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
	var id=document.getElementById("yhdxdh").value;
	var url='~/poral/doqunfa.do?yhdxdh='+id;
	window.location.href=$.utils.parseUrl(url);
}
/*//兑换红包币
function modifyhbb(grid, rowData, keyData){
     
	
	var url = "~/exchangehbb/doediteExchange.do?yhdxdh="+keyData;
	
	   $.open(url, 500, null, {}, function() {
			if ($.dialogReturnValue()) {
				grid.refresh();
			}
		});
	
}*/

//普通红包
function putongRedpackge(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_putong.jsp'
	var id=document.getElementById("yhdxdh").value;
	var url='~/exchage/doputong.do?yhdxdh='+ id;
	window.location.href=$.utils.parseUrl(url,keyData);
}

//红包领取详情
function linghb(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_putong.jsp'
	var id=document.getElementById("yhdxdh").value;
	var url='~/exchage/doling.do?yhdxdh='+ id;
	window.location.href=$.utils.parseUrl(url,keyData);
}




