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
			<a class="nav-link active" href="#">캐릭터</a>
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


<script>
	//삭제버튼 눌렀을때 확인
	function confirmDelete(n){
		var confirmDelete = confirm("정말로 삭제하시겠습니까?");
		if(confirmDelete){
			window.location="/char/deletePro?name=" + n;
		}
	}
</script>

<div class="container pt-3">
	<div class="row">
		<div class="col">
			<table class="table table-hover table-striped table-responsive-md">
				<thead class="thead-dark">
					<tr align="center">
						<th width="10%">순서</th>
						<th width="25%">캐릭명</th>
						<th width="20%">레벨</th>
						<th width="25%">클래스</th>
						<th width="10%">수정</th>
						<th width="10%">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="d" items="${list}">
						<tr align="center">
							<td class="align-middle">${d.orders}</td>
							<td class="align-middle">${d.name}</td>
							<td class="align-middle">${d.lev}</td>
							<td class="align-middle">${d.classs}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-outline-dark btn-sm" onclick="window.open('/char/updateForm?name=${d.name}', 'title', 'width=300, height=330' )">
									수정
								</button>
							</td>
							<td class="align-middle">
								<button type="button" class="btn btn-outline-dark btn-sm" onclick="confirmDelete('${d.name}')" >
									삭제
								</button>
							</td>
						</tr>
					</c:forEach>
					
					<!-- New Character -->
					<tr align="center">
						<form action="/char/addChar" method="post">
							<td></td>
							<td class="align-middle">
								<input type="text" class="form-control form-control-sm w-75" name="name"/>
							</td>
							<td class="align-middle">
								<input type="text" class="form-control form-control-sm w-50" name="lev"/>
							</td>
							<td class="align-middle">
								<input type="text" class="form-control form-control-sm w-50" name="classs"/>
							</td>
							<td colspan="2" class="align-middle">
								<button type="submit" class="btn btn-outline-dark btn-sm">캐릭터 추가</button>
							</td>
						</form>
					</tr>
					
					<!-- Change Char Order -->
					<tr>
						<td colspan="6">
							<button type="button" class="btn btn-outline-dark btn-sm">캐릭터 순서 변경</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>















