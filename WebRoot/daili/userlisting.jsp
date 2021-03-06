<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<!-- 张嘉雄
	会员信息查询
	3月25
 -->

<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/css/css.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>会员管理</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		会员中心 <span class="c-gray en">&gt;</span> 会员列表 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form
				action="${pageContext.request.contextPath}/daili_users.do?p=sousuousers"
				method="post">

				<input type="text" name="keywords" class="input-text"
					style="width: 450px" placeholder="请输入会员信息">
				<button type="submit" class="btn btn-success radius">
					<i class="Hui-iconfont">&#xe665;</i> 搜会员
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">

			<span class="r">共有数据：<strong>${usersmap.sum}</strong> 条
			</span>
		</div>
		<div class="mt-20">
			<table id="tab"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="20">序号</th>
						<th width="40">车牌号</th>
						<th width="30">二维码编号</th>
						<th width="40">微信</th>
						<th width="40">用户姓名</th>
						<th width="40">性别</th>
						<th width="40">电话号码</th>
						

						<!--  隐藏推荐人列
							<th width="40">
								推荐人
							</th>
							 -->
						<th width="40">用户状态</th>
						<th width="70">是否关注公众号</th>

						<th width="60">可提现金额</th>
						<th width="40">属于下级代理</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${usersmap.list}" var="u" varStatus="i">
						<tr class="text-c">
							<td>${i.count+(usersmap.page-1)*usersmap.size}</td>
							<td>${u.plateNumber}</td>
							<td>${u.id}</td>
							<td>${u.weixinUser.nickname}</td>
							<td>${u.name}</td>
							<td>
								<!-- 性别   1代表男     0代表女 --> <c:if test="${u.sex==1}">
									<span class="label label-defaunt radius">男</span>
								</c:if> <c:if test="${u.sex==0}">
									<span class="label label-success radius">女 </span>
								</c:if>
							</td>
							<td>${u.tel}</td>

							<!--  推荐人用ajax查询     但是推荐人记录没有意义    并没有实际统计用户推荐人次 
								<td>
									${u.tuijianren}
								</td>
								-->
							<td>
								<!-- 用户状态   1代表正常   0代表已过期 --> <c:if test="${u.overdue==0}">
									<span class="label label-success radius">未付款</span>
								</c:if> <c:if test="${u.overdue==1}">
									<span class="label label-defaunt radius">已付款未绑定</span>
								</c:if> <c:if test="${u.overdue==2}">
									<span class="label label-primary radius">已付款已绑定 </span>
								</c:if> <c:if test="${u.overdue==3}">
									<span class="label label-danger radius">过期</span>
								</c:if>
							</td>
							<td>
								<!--  是否关注微信   1代表已关注   0代表未关注 --> <c:if test="${u.role==1}">
									<span class="label label-success radius">已关注</span>
								</c:if> <c:if test="${u.role==0}">
									<span class="label label-defaunt radius">未关注</span>
								</c:if>
							</td>
							<td>${u.ketixian}</td>
							<td>
							   <c:set var="x" value="-1"></c:set>
							   <c:choose>
							     <c:when test="${proxy.level==1}">
							        <c:set var="x" value="${u.proxy2.id}"></c:set>
							     </c:when>
							     
							      <c:when test="${proxy.level==2}">
							        <c:set var="x" value="${u.proxy3.id}"></c:set>
							     </c:when>
							     
							   </c:choose>
							   <c:if test="${not empty usersmap.proxys}" var="f">
							        <select ${x>-1 ?"disabled":"" } onchange="go(this,this.value,${u.id })">
							             <option value="-1">暂没分配</option>
							             <c:forEach items="${usersmap.proxys}" var="d">
							                <option ${d.id==x ? "selected":""}   value="${d.id}">${d.realname }</option>
							             </c:forEach>
							         </select>
							   </c:if>
							   
							   <c:if test="${not f}">
							           暂无下级代理
							   </c:if>
							  
							</td>          


						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="6"><img src="../images/spacer.gif" width="1"
						height="1" /></td>
				</tr>
				<tr>
					<td height="33">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="right-font08">
							<tr>
								<td width="50%">第 <span class="right-text09">${usersmap.page}</span>
									页 | 共 <span class="right-text09">${usersmap.count }</span> 页
								</td>
								<td width="32%" align="right">[ <a
									href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=${usersmap.type}&keywords=${keywords}"
									class="right-font08">首页</a> | <a
									href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=${usersmap.type}&keywords=${keywords}&page=${usersmap.page-1}"
									class="right-font08">上一页</a> | <a
									href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=${usersmap.type}&keywords=${keywords}&page=${usersmap.page+1}"
									class="right-font08">下一页</a> | <a
									href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=${usersmap.type}&keywords=${keywords}&page=${usersmap.count}"
									class="right-font08">末页</a> ] 转至：
								</td>
								<td width="5%">
									<table width="20" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="1%"><input name="textfield3" type="text"
												id="page" value="${usersmap.page}" class="right-textfield03"
												size="3" /></td>
											<td width="87%"></td>
											<td width="87%"><input name="Submit23222" type="submit"
												value="GO" onclick="viewGo()" /></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/laypage/1.2/laypage.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/datatables/1.10.0/jquery.dataTables.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
	<script type="text/javascript">
	
	
		function viewGo() {
			var page = document.getElementById("page").value;
			if (page.match('^[0-9]*$')) {
				window.location.href = "${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=" + page;
			}
		}
		$(function() {
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
		
		function go(sel,proxy,uid)
		{
		    var url = "${pageContext.request.contextPath}/daili_users.do?p=changeProxy";
		    var data = {proxy:proxy,uid:uid};
		    var callback = function(d)
		    {
		        if (d!="success")
		        {
		          alert(d);
		        }
		        else
		        {
		          sel.disabled = true;
		        }
		        
		    };
		    $.post(url,data,callback);
		}
	</script>
</body>
</html>