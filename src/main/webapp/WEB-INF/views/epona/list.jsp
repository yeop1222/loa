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
		<li class="nav-item">
			<a class="nav-link" href="/">TODO</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/char/">캐릭터</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="#">에포나 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/npc/">호감도</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/island/">섬의마음</a>
		</li>
	</ul>
</nav>

<div class="container pt-3">
	<div class="row">
		<div class="col">
			<table class="table table-hover table-striped table-responsive-md">
				<thead class="thead-dark">
					<tr align="center">
						<th width="15%">평판명</th>
						<th width="21%">수행지역</th>
						<th width="30%">보상</th>
						<th width="9%">수행횟수</th>
						<th width="7%">총횟수</th>
						<th width="10%">캐릭터</th>
						<th width="7%">수정</th>
					</tr>
				</thead>
				
				<tbody>

					<c:forEach var="d" items="${list}">
						<tr align="center" ${d.currPoint>=d.sumPoint ? "class=\"text-danger\"": ""}>
							<td class="align-middle">${d.name}</td>
							<td class="align-middle">
								<c:forTokens items="${d.region}" delims="/" var="temp">
									${temp}<br/>
								</c:forTokens>
							</td>
							<td class="align-middle">
								<c:forTokens items="${d.reward}" delims="/" var="temp">
									${temp}<br/>
								</c:forTokens>
							</td>
							<td class="align-middle">${d.currPoint}</td>
							<td class="align-middle">${d.sumPoint}</td>

							<td class="align-middle">
								<c:if test="${d.charic == null}"> 
									- 
								</c:if>
								<c:if test="${d.charic != null}">
									${d.charic}
								</c:if>
							</td>
							<td class="align-middle">
								<button type="button" class="btn btn-outline-dark btn-sm" onclick="window.open('/epona/updateForm?name=${d.name}', '변경', 'width=300, height=330' )">
									수정
								</button>
							</td>
						</tr>
					</c:forEach>
					
					<tr>
						<td class="align-middle" colspan="7" align="center">
							<button type="button" class="btn btn-outline-dark btn-sm" onclick="">
								추가
							</button>
							<button type="button" class="btn btn-outline-dark btn-sm" onclick="">
								초기화
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>