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
    

<form action="/content/charDailyPro" method="post" name="frmcd${ch.orders}">
	<table class="table">
		<tr>
			<th width="35%">
				카오스 던전<br/>
				휴식 게이지 (${ch.restChaos})
			</th>
			<td colspan="3" class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="chaos1" value="1"/>
						카오스 
					</label>
				</div>
			</td>
			<td colspan="3" class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="chaos2" value="1" />
						카오스 
					</label>
				</div>
			</td>
		</tr>
		<tr >
			<th>
				가디언 토벌<br/>
				휴식 게이지 (${ch.restGuardian})
			</th>
			<td colspan="3" class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="guardian1" value="1" />
						가디언 
					</label>
				</div>
			</td>
			<td colspan="3" class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="guardian2" value="1" />
						가디언 
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<th rowspan="3">
				에포나 퀘스트<br/>
				휴식 게이지 (${ch.restEpona})
			</th>
			<td colspan="6" class="align-middle">
				<div class="form-check">
					<label class="form-check-label" style="color:${e1==1?'red':''}" >
						<input type="checkbox" class="form-check-input" name="eponav1" value="1" /> 
						${co.epona1}&nbsp;
					</label>
				</div>
			</td>
		</tr>
		<tr >
			<td colspan="6" class="align-middle">
				<div class="form-check">
					<label class="form-check-label" style="color:${e2==1?'red':''}">
						<input type="checkbox" class="form-check-input" name="eponav2" value="1" /> 
						${co.epona2}&nbsp;
					</label>
				</div>
			</td>
		</tr>
		<tr >
			<td colspan="6" class="align-middle">
				<div class="form-check">
					<label class="form-check-label" style="color:${e3==1?'red':''}">
						<input type="checkbox" class="form-check-input" name="eponav3" value="1" /> 
						${co.epona3}&nbsp;
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				길드출석
			</th>
			<td colspan="6">
				<div class="form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="guild" value="1" />
						길드 
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<input type="submit" value="저장" class="btn btn-outline-dark">
			</td>
		</tr>
	</table>
	<input type="hidden" name="name" value="${co.name}" />
	<input type="hidden" name="epona1" value="${co.epona1}" />
	<input type="hidden" name="epona2" value="${co.epona2}" />
	<input type="hidden" name="epona3" value="${co.epona3}" />
	<input type="hidden" name="charOpt" value="${ch.orders}" />
	<input type="hidden" name="charOpt2" value="${charOpt2}" />
	<input type="hidden" name="wonOpt" value="${wonOpt}" />
</form>

<script>
	//TODO dto에서 값받아다가 체크박스 체크하기
	if(${co.chaos} > 0){
		document.frmcd${ch.orders}.chaos1.checked = true;
	}
	if(${co.chaos} > 1){
		document.frmcd${ch.orders}.chaos2.checked = true;
	}
	
	if(${co.guardian} > 0){
		document.frmcd${ch.orders}.guardian1.checked = true;
	}
	if(${co.guardian} > 1){
		document.frmcd${ch.orders}.guardian2.checked = true;
	}

	if(${co.eponav1} == 1){
		document.frmcd${ch.orders}.eponav1.checked = true;
	}
	if(${co.eponav2} == 1){
		document.frmcd${ch.orders}.eponav2.checked = true;
	}
	if(${co.eponav3} == 1){
		document.frmcd${ch.orders}.eponav3.checked = true;
	}
	
	if(${co.guild} == 1){
		document.frmcd${ch.orders}.guild.checked = true;
	}
</script>