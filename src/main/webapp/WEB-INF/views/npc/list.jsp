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
			<a class="nav-link" href="#">호감도</a>
		</li>
		<li class="nav-item active">
			<a class="nav-link" href="/island/">섬의마음</a>
		</li>
	</ul>
</nav>

<div class="container pt-3">
	<div class="row">
		<div class="col">
			<form class="form-inline" method="post" onsubmit="onSearch(this)" name="frm">
				<label for="sel1">필터 옵션을 선택하세요:&nbsp;</label>
				<select class="form-control" id="sel1" name="filter" onchange="window.location='/npc/?filter='+this.value" onclick="this.value=-1">
					<option value="0">없음</option>
					<option value="1">티어별 정렬</option>
					<option value="2">대륙별 정렬</option>
					<option value="3">거인의 심장</option>
					<option value="4">오르페우스의 별</option>
					<option value="5">위대한 미술품</option>
					<option value="6">섬의 마음</option>
					<option value="7">비밀지도(모험물)</option>
				</select>
				&nbsp;
				<input type="text" class="form-control"  name="search" placeholder="보상 검색"/>
				&nbsp;
			 	<input type="submit" class="btn btn-outline-dark btn-sm" value="검색"/>
			</form>
			<script>
				document.frm.filter.value=${filter}
				document.frm.search.value=${search}
			</script>
			
		</div>
	</div>
	<div class="row">
		<div class="col">
			<table class="table table-hover table-striped table-responsive-md">
				<thead class="thead-dark">
					<tr align="center">
						<th>이름</th>
						<th>대륙</th>
						<th>티어</th>
						<th>노래</th>
						<th>감정표현</th>
						<th>보상</th>
						<th>현재호감도</th>
						<th>남은호감도</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="d" items="${list}">
						<tr>
							<td class="align-middle text-center">${d.name}</td>
							<td class="align-middle text-center">${d.location}</td>
							<td class="align-middle text-center">${d.tier}</td>
							<td class="align-middle text-center">
								${d.song1}&nbsp;${d.songsc1}
								<c:if test="${d.song2 != null}">
									<br/>
									${d.song2}&nbsp;${d.songsc2}
								</c:if>
							</td>
							<td class="align-middle text-center">
								${d.emote1}&nbsp;${d.emotesc1}
								<c:if test="${d.emote2 != null}">
									<br/>
									${d.emote2}&nbsp;${d.emotesc2}
								</c:if>
							</td>
							<td class="align-middle text-center">
								<button class="btn btn-outline-dark btn-sm" onclick="window.open('/npc/reward?name=${d.name}', 'title', 'width=500, height=250')">
									확인
								</button>
							</td>
							<td class="align-middle text-center">${d.currscore}</td>
							<td class="align-middle text-center">-</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
