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
 * 普通红包
 */
function doSaveputong() {
	var valInfo = $.validation.validate("#SEC_PUTONG_FOMR");
	if (valInfo.isError)
		return;

	var putong = $('#SEC_PUTONG_FOMR').toJson();

	$.dataservice("spring:redpackageService.putonghb", putong, function(response) {
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 群红包
 */
function doSavequnfa() {
	var valInfo = $.validation.validate("#SEC_QUNFA_FOMR");
	
	if (valInfo.isError)
		return;

	var qunfa = $('#SEC_QUNFA_FOMR').toJson();

	$.dataservice("spring:redpackageService.saveOrUpdateRedpackge", qunfa, function(response) {
		alert(1);
				$.dialogReturnValue(true);
				$(document).dialogClose();
			});
}

/**
 * 派红包和抢红包
 * @return
 */
function doredhb(grid, rowData, keyData){
	
	/*alert("进来了");
	  $(function() {     
		    $("#btnphb").click(function() {     
		        $.ajax({     
		            //要用post方式      
		            type: "Post",     
		            //方法所在页面和方法名      
		            url: "register.jsp/doQianghb",
		            data:"{'yhdxdh':'123'}",
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
		    });     
		});    */
	var class = $("#text").attr("class");
	var url = '~/exchage/registers.do?userphnoe='+keyData;
	window.location.href=$.utils.parseUrl(url,keyData);
	
	 
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
	
	var url='~/exchage/doputong.do?yhdxdh='+ keyData;
	alert(1);
	$.open(url, 680, null, {}, function() {
				if ($.dialogReturnValue()) {
					grid.refresh();
				}
			});
}

//抢红包
function qunfaRedpackge(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
	
	//var url='~/web/red/takePacket.jsp';
	window.location.href='../red/takePacket.jsp';
}

//抢红包
function qianghb(grid, rowData, keyData) {
	//var url = '~/modules/hongbao/edit_sec_qunfa.jsp'
	
	var url='~/poral/doqunfa.do?yhdxdh='+keyData;
	$.open(url, 750, 750, {}, function() {
		if ($.dialogReturnValue()) {
			user_grid.refresh();
		}
	});
	
}

