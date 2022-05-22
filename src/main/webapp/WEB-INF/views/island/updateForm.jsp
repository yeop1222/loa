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

<div class="container pt-2">
	<form action="/island/updatePro" method="post">
			<input type="hidden" name="num" value="${num}"/>
		<div class="row">
			<div class="col">
				<b>${dto.name}</b>
			</div> 
		</div>
		<div class="row">
			<div class="col">
				<div class="container pt-1 pl-3">
					<div class="form-check">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="isGot" value="1" ${dto.isGot==1 ? "checked" : ""} />
							획득여부
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="container ml-n3 pt-2">
					<button type="submit" class="btn btn-primary btn-outline-dark">수정</button>
					<button type="button" class="btn btn-outline-dark" onclick="window.close()">취소</button>
				</div>
			</div>
		</div>
	</form>
</div>