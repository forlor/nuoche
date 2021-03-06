<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>首页</title>
		<meta name="viewport"
			content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/iconfont.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/weixin/css/icons-extra.css" />
		
		<script type="text/javascript" src = "https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/common_js.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/layer/layer.js"></script>
		
		<style>
		    .mui-search .mui-placeholder {
				text-align: left;
				color: white;
			}
			
			.mui-search .mui-placeholder .mui-icon,
			.mui-input-row .mui-input-clear~.mui-icon-clear,
			.mui-input-row .mui-input-password~.mui-icon-eye,
			.mui-input-row .mui-input-speech~.mui-icon-speech,
			.mui-search.mui-active:before {
				color: white;
			}
			
			.goods-sharing {
				width: 20%;
				margin-left: 87%;
				margin-top: -14%;
			}
			
			.goods-sharing img {
				width: 30%;
			}
			
			.layer-sharing {
				width: 90%;
				height: 400px;
				border-radius: 5px 5px 5px 5px;
			}
			
			.goods-image {
				width: 110%;
				height: 200px;
				margin-left: -5%;
				margin-top: -7%;
				border-radius: 5px 5px 0px 0px;
			}
			
			.goods-image img {
				width: 100%;
				height: 200px;
				border-radius: 5px 5px 0px 0px;
			}
			
			.goods-name {
				width: 100%;
				margin-top: 10%;
				line-height: 25px;
				/*height: 60px;*/
				font-family: 幼圆;
				font-size: 14px;
				color: #484234;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				-webkit-line-clamp: 2;
				overflow: hidden;
			}
			
			.mui-btn-block {
				width: 100%;
				margin-top: 15%;
				border-radius: 30px 30px 30px 30px;
				background: #FF7900;
				border: none;
			}
			
			#tongzhi {
				height: 10px;
				width: 10px;
				background-color: red;
				border-radius: 50%;
				-moz-border-radius: 50%;
				-webkit-border-radius: 50%;
				border: 1px solid white;
				position: absolute;
				top: 23%;
				right: 3%;
				z-index: 2;
				display: none;
			}
			.mui-icon-chat{
				font-size: 22px;
			}
			
			.mui-media-body
			{
			   font-size: 8px;
			}
</style>
	</head>

	<body>
		<!--搜索框-->
		<div class="top-search"
	 		style="position: fixed; z-index: 9999; width: 100%;color: white; background: #FF7900;">
			<p>
				<a style="color: white;margin-left: 14px;"
					onclick="clicked('${pageContext.request.contextPath}/weixinCheyou.do?p=scan',true,true)"><span
					class="mui-icon-extra mui-icon-extra-sweep"></span>
				</a>
			</p>
			<div class="button"
				style="font-size: 9px; margin-top: -14px; margin-left: 14px; color: white;">
				扫一扫
			</div>
			<div style="margin-left: -40px; margin-top: 10px;">
				<div
					style="margin: 0px 100px; margin-top: -20px; height: 0px; width: 60%; border-bottom: 1px solid white; border-left: 1px solid white; border-right: 1px solid white;"></div>
				<div class="mui-input-row mui-search"
					style="margin: 0px auto; text-align: left; margin-top: -35px; width: 50%;">
					<input id="search" style="color: white; background: #FF7900;"
						type="search" class="mui-input-clear" placeholder=""
						onkeyup="enterSearch(event)">
				</div>
			</div>
			<div class="flex-container"
				style="margin-top: -40px; float: right; margin-right: 45px;">
				<span id="show-search" style="padding: 15px 15px 0px; color: white;">搜索</span>
			</div>
			<div class="flex-container"
				style="margin-top: -38px; float: right; margin-right: 15px;">
				<a id="home-kefu" style="color: white;"><span
					class="mui-icon mui-icon-chat"></span>
				</a>
				<div id="tongzhi"></div>

			</div>
		</div>
		
		<div class="kb" style="height: 45px;width: 100%;">
		</div>
		
		
		<!--轮播-->
		<div id="slider" class="mui-slider">
			<div class="mui-slider-group mui-slider-loop" id="lunbo">
			</div>
			<div class="mui-slider-indicator" id="lunboNum">
			</div>
		</div>
           
           
        <link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/collection/collection2.css">
		
		<!-- 商品展示-->
		<div class="mui-content mui-scroll-wrapper" style="margin-top: 220px;"
			id="pullrefresh">
			<div class="mui-scroll">
				<ul id="goodslist" class="mui-table-view ">

					<!--<li>
					<div class="mui-slider-handle collection_product">
						<a href="javascript:void(0)">
							<div class="collection_detail ">
								<span id="gname" class="collection_gname ">glist[i].gname</span>
								<span class="collection_gprice ">￥glist[i].gprice</span>
								<span class="collection_name ">glist[i].gdetail</span>
							</div>
							<div class="collection_img">
								<img src="'+"${pageContext.request.contextPath}/"+glist[i].gimages+'" />
							</div>
						</a>
					</div>
				</li>-->

				</ul>
			</div>
		</div>
		<div style="clear: both; height: 70px">
		</div>
	</body>

	<script>
	    

		//商品列表
		function goods(gttId,gttName)
		{
			window.top.location = "${pageContext.request.contextPath}/"+"weixin/home/goods.jsp?gttid="+gttId+"&gttname="+ encodeURIComponent(gttName);
		}
		
		function goodsmore(gtId,gtName)
		{
			window.top.location = "${pageContext.request.contextPath}/"+"weixin/home/goodsmore.jsp?gtid="+gtId+"&gtname="+gtName;
		}
		

		
		var userid = '${userinfo.usersId}';
		var lay;
		var index = 0;

		function goGoods(gid, state) {
			layer.closeAll();
			window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/detail.jsp?gid="+gid+"&state=1";
			
		}
		
		

			
			
			
			
			
		//同步商家消息
		setInterval(function() {
			var list = null;
			if(!userid){
				return;
			}
			mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=getadminmsg' + '&userid=' + userid + '&x=' + Math.random(), {
				type: "post",
				timeout: 30000,
				success: function(data) {
					var map = eval("(" + data + ")");
					for(var key in map) {
						if(key == "list") {
							list = map[key];
						}
					}
					if(list != null) {
						if(list.length > 0) {
							$("#tongzhi").show();
							/*播放音频*/
							//startPlay("${pageContext.request.contextPath}/weixin/music/3.wav");	
							/*播放音频*/
						} else {
							$("#tongzhi").hide();
						}
					}
				}
			});
			
			
			
		}, 3000);
		/*得到商家消息*/
			
			
			
			
			//获取远程轮播图
			var fragment1 = document.createDocumentFragment();
			mui.ajax("${pageContext.request.contextPath}/appLunbo.do?p=getAllLunbo", {
					//dataType: 'json', //服务器返回json格式数据
					type: 'post', //HTTP请求类型
					timeout: 30000, //超时时间设置为10秒；	
					success: function(data) {
					   
						//服务器返回响应，根据响应结果，分析是否登录成功；
						var js = eval("( " + data + ")");
						var div_last = document.createElement("div");
						div_last.className = "mui-slider-item";
						var a_last = document.createElement("a");

						var img_last = document.createElement("img");
						img_last.src = "${pageContext.request.contextPath}" + js[js.length - 1].cimages;
						img_last.style.height = '200px';
						div_last.appendChild(a_last);
						a_last.appendChild(img_last);
						fragment1.appendChild(div_last);
						for(var i = 0; i < js.length; i++) {
						   
							var div = document.createElement("div");
							div.className = "mui-slider-item";
							var a = document.createElement("a");
							//js[i].cimgDescribe.trim()
							//$(a).attr("onclick", "lb(\'" + js[i].cimgType + '\',\'' + js[i].cimgUrl + '\',\'' + "" + '\',\'' + js[i].cimgTitle + '\',\'' + js[i].cimages + "\')");
							var img = document.createElement("img");
							img.src = "${pageContext.request.contextPath}" + js[i].cimages;
							img.style.height = "200px";
							div.appendChild(a);
							a.appendChild(img);

							fragment1.appendChild(div);
							var div2 = document.createElement("div");
							if(js.length >= 2) {
								if(i == 0) {
									div2.className = "mui-indicator mui-active";
								} else {
									div2.className = "mui-indicator";
								}

							}
							document.getElementById("lunboNum").appendChild(div2);

						}
						var div_first = document.createElement("div");
						div_first.className = "mui-slider-item mui-slider-item-duplicate";
						var a_first = document.createElement("a");

						var img_first = document.createElement("img");
						img_first.src = "${pageContext.request.contextPath}" + js[0].cimages;
						img_first.style.height = "200px";
						div_first.appendChild(a_first);
						a_first.appendChild(img_first);
						fragment1.appendChild(div_first);

						$("#lunbo").append(fragment1);

						//图片轮播
						var slider = mui("#slider");

						if(js.length == 1) {
							slider.slider({
								interval: 0
							});
						} else {
							slider.slider({
								interval: 3000
							});
						}
					},

					error: function(xhr, type, errorThrown) {
						//异常处理；
						if(type == 'timeout') {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
						if(type == 'abort') {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						} else {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
					}

				}

			);


		function scaned(t, r, f) {
			var gid = null;
			var gname = r.substring(r.indexOf('+') + 1);
			var g_url = r.substring(0, r.indexOf('+'));
			mui.post("${pageContext.request.contextPath}/" + 'appgoods.do?p=getGoodsId', {
				gname: gname
			}, function(data) {
				gid = data;
				window.top.location = "${pageContext.request.contextPath}/weixin/"+g_url+"?gid="+gid;
			});
		}
		//轮播图内容 or 链接
		function lb(t, url, x, title, img) {
			if(t == 1) {
				window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/detail.jsp?gid="+url+"&state=1";
			} else if(t == 2 ){
				//plus.runtime.openURL(url)
			}else {
				window.top.location = "${pageContext.request.contextPath}/weixin/home/lunbo.jsp?neiro="+neiro+"&title="+title+"&img="+img;
			}
		}
		//搜索
		$("#show-search").click(function() {
			var keywords = $("#search").val();
			if(keywords == "") {
				mui.toast("搜索内容不能为空");
				return;
			}
			window.top.location = "${pageContext.request.contextPath}/weixin/home/goods.jsp?keyword="+encodeURI(keywords);
			return;
		});
		//客服 消息
		$("#home-kefu").click(function() {
			$("#tongzhi").hide();
			index = 0;
			if(userid != null) {
				window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/kefu.jsp";
			} else {
				goLogin();
			}
		});
		//去登录界面
		function goLogin() {
			mui.toast("请先登录！");
			window.top.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";
		}

		function enterSearch(e) {
			if(13 == e.keyCode) {
				$("#search-input").blur();
				var keyword = $("#search").val()
				window.top.location = "${pageContext.request.contextPath}/weixin/home/goods.jsp?keyword="+keyword;

			}
		}

		window.addEventListener("showMsg", function(e) {

			layer.open({
				content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>再按一次退出！</div>',
				time: 1
			});
		});


		
		
		
		
		   mui.init({
				pullRefresh: {
					container: '#pullrefresh',
					up: {
						contentrefresh: "正在加载·····",
						auto: true,
						callback: pullupRefresh
					}
				}
			});
			//mui(".mui-content").scroll();
			var glist = null;
				var count = null
				var url = null;
			window.onload = function (){
			
				
				//mui.plusReady(function() {
					
					//var goods = plus.webview.currentWebview();
					//var gttname = document.getElementById("gttname");
					gttid = '${param.gttid}';
					gttid = gttid.trim().length>0?gttid:null;
					//关键词
					keyword = '${keyword}';
					//判断是从主页过来的，还是从关键词搜索过来
					if(gttid == null && keyword != "") {
						//gttname.innerHTML = keyword + "的搜索结果";
						url = "${pageContext.request.contextPath}/appsearch.do?p=search"
					} else {
						//gttname.innerHTML = '${gttname}';
						url = "${pageContext.request.contextPath}/appgoods.do?p=fenye";
					}
					
			}
			
			var userid = '${userinfo.usersId}';
			
			  function getUrlParam (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                    if (r!= null) {
        				 return unescape(r[2]);
     			 	 }else{
        			 	 return null;
      				}
 		    	} 
			
			
			var page = 1;
			var size = 6;
			//上拉加载
			function pullupRefresh() {
		       setTimeout(function() {
				
						mui.post(url, {
								"keyword": keyword,
								"page": page,
								"size": size
							},
							function(data) {
								var map = eval("(" + data + ")");
								for(var key in map) {
									if(key == "goodslist") {
										glist = map[key];
									}
									if(key == "count") {
										count = map[key];

									}
								}
								page = page * 1 + 1; 

								var goodsfragment = document.getElementById("goodslist");//document.createDocumentFragment();
								for(var i = 0; i < glist.length; i++) {
									
									var goodsli = document.createElement("li");
									goodsli.id = glist[i].gid;
									goodsli.className = "mui-table-view-cell";
//									goodsli.style.padding = '0px';
									goodsli.style.paddingLeft='0px';
									goodsli.style.paddingTop='0px';
									goodsli.style.paddingRight='0px';
									goodsli.style.paddingBottom='1px';
									var state = glist[i].gstatus;
									var jianjie = glist[i].jianjie;
//									if(jianjie.length==0){
//										jianjie = glist[i].gname;
//									}
									goodsli.setAttribute("state",state) ;
									if(i!=glist.length-1){
										var button = '<button onclick="music('+glist[i].gid +')"  class="buybutton" style="margin-top:-39px;left:110px;height: 24px;line-height: 12px;text-align: center;font-size: 11px;">听歌打折</button>&nbsp;<button type="button" onclick="goumai(\'' + glist[i].price + '\',\'' + glist[i].userid + '\',\'' + glist[i].gid + '\',\'' + glist[i].gname + '\',\'' + "${pageContext.request.contextPath}" + glist[i].gimages + '\',\''+glist[i].gdanwei+'\')"  class="buybutton" style="margin-top:-39px;left:130px;height: 24px;line-height: 12px;text-align: center;font-size: 11px;">购&nbsp;买</button>';
										if(state==0){
											button  = '<button type="button" onclick=""  class="buybutton" style="margin-top:-39px;left:180px;height: 24px;line-height: 12px;text-align: center;font-size: 11px;background:#C0C0C0	">已下架</button>';
										}
										goodsli.innerHTML = '<div class="mui-slider-handle collection_product"><a href="javascript:void(0)" _onclick="goodsdetail(\'' + glist[i].jianjie + '\',\'' + glist[i].gname + '\',\'' + glist[i].gprice + '\',\'' + glist[i].gvipprice + '\',\'' + "${pageContext.request.contextPath}" + glist[i].gimages + '\',\'' + 1+ '\',\'' + glist[i].gdanwei + '\',\'' + glist[i].youfei + '\',\'' + glist[i].buyCount + '\')"><div class="collection_detail"><div class="collection_detail1" style="margin-top:1px;"><span  style="color:#333333; font-size:13px;">' + glist[i].gname+ '</span><p class="miaosu">' + glist[i].jianjie+ '</p></div>' +
										'<div class="collection_detail2"></div><div class="collection_detail3" style="margin-top:-12px"><span class="" style="color:#FF4500; font-size:18px">￥' + glist[i].price + '</span><span class=""  style="color:#999999; font-size:12px"> ' + glist[i].buyCount + '人付款</span></div><div>'+button+'</div></div>' +
										'<div class="collection_img" style="margin-top:-1px;"><img width="100px" height="100px" border=0 src="' + "${pageContext.request.contextPath}" + glist[i].gimages + '" /></div></a></div>';
									}else{
										var button = '<button onclick="music('+glist[i].gid +')" class="buybutton" style="margin-top:-39px;left:110px;height: 24px;line-height: 12px;text-align: center;font-size: 11px;">听歌打折</button>&nbsp;<button type="button" onclick="goumai(\'' + glist[i].price + '\',\'' + glist[i].userid + '\',\'' + glist[i].gid + '\',\'' + glist[i].gname + '\',\'' + "${pageContext.request.contextPath}" + glist[i].gimages + '\',\''+glist[i].gdanwei+'\')"  class="buybutton" style="margin-top:-39px;left:130px;height: 24px;line-height: 12px;text-align: center;font-size: 11px;">购&nbsp;买</button>';
										if(state==0){
											button = '<button type="button" onclick=""  class="buybutton" style="margin-top:-39px;left:180px;height: 24px;line-height: 12px;text-align: center;font-size: 11px;background:#C0C0C0	">已下架</button>';
										}
										goodsli.innerHTML = '<div class="mui-slider-handle collection_product"><a href="javascript:void(0)" _onclick="goodsdetail(\'' + glist[i].jianjie + '\',\'' + glist[i].gname + '\',\'' + glist[i].gprice + '\',\'' + glist[i].gvipprice + '\',\'' + "${pageContext.request.contextPath}" + glist[i].gimages + '\',\'' + 1+ '\',\'' + glist[i].gdanwei + '\',\'' + glist[i].youfei + '\',\'' + glist[i].buyCount + '\')"><div class="collection_detail" style="border-bottom: 0px solid #C8C7CC;"><div class="collection_detail1" style="margin-top:1px;"><span class=""  style="color:#333333; font-size:13px">' + glist[i].gname + '</span><p class="miaosu">' + glist[i].jianjie+ '</p></div>' +
										'<div class="collection_detail2"></div><div class="collection_detail3" style="margin-top:-12px"><span class="" style="color:#FF4500; font-size:18px">￥' + glist[i].price + '</span><span class=""  style="color:#999999; font-size:12px"> ' + glist[i].buyCount + '人付款</span></div><div>'+button+'</div></div>' +
										'<div class="collection_img" style="margin-top:-1px;"><img width="100px" height="100px" border=0 src="' + "${pageContext.request.contextPath}" + glist[i].gimages + '" /></div></a></div>';
									}
									
									
									
									if(state !=2){
										goodsfragment.appendChild(goodsli);
									}
									
								}

								mui("#pullrefresh").pullRefresh().endPullupToRefresh(page > count);

							}

						);
					}, 500);
				//});

			}
			
			
			mui('.mui-content').on('tap', 'li', function(e) {
				if(e.target.tagName=="BUTTON"){
					$(e.target).trigger("click");
					return false;
				}
				var gid = this.getAttribute("id");
				var state = this.getAttribute("state");
				window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/detail.jsp?gid="+gid+"&state="+state;
			});
			
			function goumai(gprice,userid,gid,gname,gimages,gdanwei) {
				if(userid != null) {
				   window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/ljgm-order.jsp?userid="+userid+"&gprice="+gprice+"&gname="+gname+"&gimages="+gimages+"&gid="+gid+"&gdanwei="+gdanwei;
			     } else {
				   goLogin();
			     }
			}
			

            function music(gid)
            {
            
                location  = "${pageContext.request.contextPath}/weixin/home/music.jsp?gid="+gid;
            }
			
			
	</script>

</html>