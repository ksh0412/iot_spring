<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>

<link rel="stylesheet" href="<c:url value="/resources/ui/signin.css?version=<%=version%>"/>" />
<body>

	<div class="shared-header">
		<div class="navbar navbar-default navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<div class="loading-spinner">
						<i class="fa fa-cog fa-spin"></i>
					</div>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav"></ul>
					<ul class="nav navbar-nav navbar-right">
					</ul>
				</div></div></div></div>
	<div class="flash-container sticky-div alert alert-info hidden" id="bootstrap_flash_container">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<i class=" fa fa-exclamation-triangle"></i>
					<i class=" fa fa-exclamation-circle"></i><i class=" fa fa-check"></i>
					<span class="flash-message"></span>
				</div>
			</div>
		</div>
	</div>

	<div class='container main-content'>
		<div class='row'>
			<div class='col-xs-6'>
				<div id="page-devise">
					<div class="page-header text-center">
						<h1>IOT Engine log in</h1>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<form novalidate="novalidate" class="simple_form new_user"
								id="new_user" action="/user/login_ok.jsp" accept-charset="UTF-8"
								method="get">
								<input name="utf8" type="hidden" value="&#x2713;" />
								<input type="hidden" name="authenticity_token"
									value="yZcjcnUoldm1IastBjwB5xIj7BvVVeP88niqClNv05FQ5QqpNAEDTa5p/LGrCecQL5nCnU+BwrH9hlKM17EpEw==" />
								<div class="form-group email optional user_email">
									<label class="email optional control-label" for="user_email">Email</label><input
										class="string email optional form-control"
										autofocus="autofocus" type="email" value="" name="id"
										id="id" />
								</div>
								<div class="form-group password optional user_password">
									<label class="password optional control-label"
										for="user_password">Password</label><input
										class="password optional fs-hide form-control" type="password"
										name="pwd" id="pwd" />
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-xs-6 forgot">
											<a href="/users/password/new">Password help</a>
										</div>
										<div class="col-xs-6">
											<button type="button" class="btn btn-primary btn-block btn-bevel-white">Log
												in</button>
										</div></div></div></form></div></div></div></div></div></div>
	<script>
	$("button.btn").click(function(){
		var id=$("#id").val();
		var pwd=$("#pwd").val();
		var param={};
		param["userId"]=id;
		param["userPwd"]=pwd;
		param=JSON.stringify(param);
		$.ajax({ 
	        type     : "POST"
	    ,   url      : "${rootPath}/user/login"
	    ,   dataType : "json" 
	    ,   beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	    }
	    ,   data     : param
	    ,   success : function(result){
		       alert(result.msg);
	    	if(result.data=="S"){
	    		location.href="${rootPath}" + result.url;
	    	}
	    }
	    ,   error : function(xhr, status, e) {
	          alert("에러 : "+e);
	   },
	   done : function(e) {
	   }
	   })
	});
						
	</script>
</body>
</html>