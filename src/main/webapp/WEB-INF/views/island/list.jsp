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
		<li class="nav-item ">
			<a class="nav-link" href="/epona/">에포나 관리</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/npc/">호감도</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="#">섬의마음</a>
		</li>
	</ul>
</nav>

<div class="container pt-3">
	<div class="row">
		<div class="col">
			<h6>
				총 섬마 개수 : ${ISLAND_TOTAL} = 
				획득한 섬마 개수 : ${count} + 
				남은 섬마 개수 : ${ISLAND_TOTAL-count}
			</h6>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<table class="table table-hover table-striped table-responsive-md">
				<thead class="thead-dark">
					<tr align="center">
						<th width="10%">번호</th>
						<th width="25%">이름</th>
						<th width="35%">획득처</th>
						<th width="10%">획득여부</th>
						<th width="10%">획득률</th>
						<th width="10%">변경</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="d" items="${list}">
						<tr align="center" ${(d.isGot==1 ? "class=\"text-danger\"": "")}>
							<td class="align-middle">${d.num}</td>
							<td class="align-middle">${d.name}</td>
							<td class="align-middle">${d.getHow==null ? "-" : d.getHow}</td>
							<td class="align-middle">${d.isGot==1 ? "O" : "&times;"}</td>
							<td class="align-middle">${d.percent}%</td>
							<td class="align-middle">
								<button type="button" class="btn btn-outline-dark btn-sm" onclick="window.open('/island/updateForm?num=${d.num}','수정','width=200 height=125')">
									변경
								</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</div>
