<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<div class="container pt-3">
	<form action="/epona/updatePro" method="post">
		<input type="hidden" name="name" value="${dto.name}"/>
		<div class="form-group">
			<b>평판명</b><br/>
			${dto.name}
		</div>
		<div class="form-group">
			<label for="t2">현재 포인트</label>
			<input type="text" class="form-control" id="t2" name="currPoint" value="${dto.currPoint}" autofocus >
		</div>
		<div class="form-group">
			<label for="t3">수행 캐릭터</label>
			<input type="text" class="form-control" id="t3" name="charic" value="${dto.charic}" >
		</div>
		<button type="submit" class="btn btn-primary btn-outline-dark">수정</button>
		<button type="button" class="btn btn-outline-dark" onclick="window.close()">취소</button>
	</form>
</div>