<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- NavBar -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">My로요일</a>
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="#">TODO</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/char/">캐릭터</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/epona/">에포나 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/npc/">호감도</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/island/">섬의마음</a>
		</li>
	</ul>
</nav>

<!-- Content -->
<div class="container pt-3">
	<div class="row">
		<!-- 원정대 컨텐츠 -->
		<div class="col-md-6 ">
			<div class="container pt-3">
				<div class="row">
					<ul class="nav nav-pills nav-justified">
						<li class="nav-item">
							<a class="nav-link active">원정대 컨텐츠</a>
						</li>
					</ul>
				</div>
				<div class="row">
					<div class="container pt-3 border">
						<!-- 메뉴 탭 -->
						<ul class="nav nav-pills" role="tablist">
							<li class="nav-item">
								<a class="nav-link ${wonOpt==0?'active':''}" data-toggle="pill" href="#cdaily">일간 컨텐츠</a>
							</li>
							<li class="nav-item">
								<a class="nav-link ${wonOpt!=0?'active':''}" data-toggle="pill" href="#cweekly">주간 컨텐츠</a>
							</li>
						</ul>
						
						<div class="tab-content">
							<!-- 일간 컨텐츠 -->
							<div class="tab-pane container ${wonOpt==0?'active':'fade'}" id="cdaily"><br/>
								<jsp:include page="content/won_day.jsp"/>
							</div>
							
							<!-- 주간 컨텐츠 -->
							<div class="tab-pane container ${wonOpt!=0?'active':'fade'}" id="cweekly"><br/>
								<jsp:include page="content/won_week.jsp"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 캐릭별 컨텐츠 -->
		<div class="col-md-6 ">
			<div class="container pt-3">
				<!-- 캐릭별 일간 컨텐츠 -->
				<div class="row">
					<ul class="nav nav-pills nav-justified">
						<li class="nav-item">
							<a class="nav-link active">캐릭별 일간</a>
						</li>
					</ul>
				</div>
				<div class="row">
					<div class="container pt-3 mb-3 border">
						<!-- 메뉴 탭 -->
						<ul class="nav nav-pills" role="tablist">
							<c:forEach var="d" items="${charList}">
								<li class="nav-item">
									<a class="nav-link ${charOpt==d.orders?'active':''}" data-toggle="pill" href="#char_${d.orders}">${d.name}</a>
								</li>
							</c:forEach>
						</ul>
						
						<div class="tab-content">
							<c:forEach var="d" items="${charList}">
								<div class="tab-pane container ${charOpt==d.orders?'active':'fade'}" id="char_${d.orders}">
									<jsp:include page="${request.contextPath}/content/charDaily">
										<jsp:param value="${d.name}" name="name"/>
									</jsp:include>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				
				<!-- 캐릭별 주간 컨텐츠 -->
				<div class="row">
					<ul class="nav nav-pills nav-justified">
						<li class="nav-item">
							<a class="nav-link active">캐릭별 주간</a>
						</li>
					</ul>
				</div>
				<div class="row">
					<div class="container pt-3 border">
						<!-- 메뉴 탭 -->
						<ul class="nav nav-pills" role="tablist">
							<c:forEach var="d" items="${charList}">
								<li class="nav-item">
									<a class="nav-link ${charOpt2==d.orders?'active':''}" data-toggle="pill" href="#char2_${d.orders}">${d.name}</a>
								</li>
							</c:forEach>
						</ul>
						
						<div class="tab-content">
							<!-- 주간 컨텐츠 -->
							<c:forEach var="d" items="${charList}">
								<div class="tab-pane container ${charOpt2==d.orders?'active':'fade'}" id="char2_${d.orders}">
									<jsp:include page="${request.contextPath}/content/charWeekly">
										<jsp:param value="${d.name}" name="name2"/>
									</jsp:include>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>