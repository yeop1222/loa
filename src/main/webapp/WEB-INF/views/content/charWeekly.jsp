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


<form onsubmit="return setSubmit2(this)" method="post" name="frmcw${ch.orders}">
	<table class="table">
		<tr>
			<th width="35%">주간 에포나</th>
			<td class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="epona1" value="1" ${co.epona>0? "checked": "" }/>
						주간 
					</label>
				</div>
			</td>
			<td class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="epona2" value="1" ${co.epona>1? "checked": "" }/>
						주간 
					</label>
				</div>
			</td>
			<td class="align-middle">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="epona3" value="1" ${co.epona>2? "checked": "" }/>
						주간 
					</label>
				</div>
			</td>
		</tr>
		<c:if test="${ch.lev>= 1340.0 && ch.lev<1415.0}">
			<tr>
				<th>아이라의 눈</th>
				<td colspan="3" class="align-middle">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="oreha" value="1" ${co.oreha==1? "checked":"" }/>
							어비스 던전
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ch.lev>= 1475.0}">
			<tr>
				<th>카양겔</th>
				<td colspan="3" class="align-middle">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="kayangel" value="1" ${co.kayangel==1? "checked":"" }/>
							어비스 던전
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ch.lev>= 1370.0 && ch.lev<1475.0}">
			<tr>
				<th>아르고스</th>
				<td colspan="3" class="align-middle">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="argos" value="1" ${co.argos==1? "checked":"" }/>
							어비스 레이드
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ch.lev>= 1415.0}">
			<tr>
				<th class="align-middle">발탄</th>
				<td colspan="3" class="align-middle">
					<div class="form-inline">
						<select class="form-control" name="gun1">
							<option value="0" ${co.gun1==0?"selected":"" }>-</option>
							<option value="2" ${co.gun1==2?"selected":"" }>노말</option>
							<option value="3" ${co.gun1==3?"selected":"" }>하드</option>
						</select>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ch.lev>= 1430.0}">
			<tr>
				<th class="align-middle">비아키스</th>
				<td colspan="3" class="align-middle">
					<div class="form-inline">
						<select class="form-control" name="gun2">
							<option value="0" ${co.gun2==0?"selected":"" }>-</option>
							<option value="2" ${co.gun2==2?"selected":"" }>노말</option>
							<option value="3" ${co.gun2==3?"selected":"" }>하드</option>
						</select>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ch.lev>= 1385.0}">
			<tr>
				<th class="align-middle">쿠크세이튼</th>
				<td colspan="3" class="align-middle">
					<div class="form-inline">
						<select class="form-control" name="gun3">
							<option value="0" ${co.gun3==0?"selected":"" }>-</option>
							<option value="1" ${co.gun3==1?"selected":"" }>리허설</option>
							<option value="2" ${co.gun3==2?"selected":"" }>노말</option>
							<option value="3" ${co.gun3==3?"selected":"" }>하드</option>
						</select>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${ch.lev>= 1430.0}">
			<tr>
				<th class="align-middle">아브렐슈드</th>
				<td colspan="3" class="align-middle">
					<div class="form-inline">
						<select class="form-control" name="gun4">
							<option value="0" ${co.gun4==0?"selected":"" }>-</option>
							<option value="1" ${co.gun4==1?"selected":"" }>데자뷰</option>
							<option value="2" ${co.gun4==2?"selected":"" }>노말</option>
							<option value="3" ${co.gun4==3?"selected":"" }>하드</option>
						</select>
					</div>
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="4">
				<input type="submit" value="저장" class="btn btn-outline-dark"/>
			</td>
		</tr>
	</table>
	<input type="hidden" name="epona" value="${co.epona }"/>
	<input type="hidden" name="charName" value="${ch.name }"/>
	<input type="hidden" name="charOpt" value="${charOpt}" />
	<input type="hidden" name="charOpt2" value="${ch.orders}" />
	<input type="hidden" name="wonOpt" value="${wonOpt}" />
</form>

<script>


	function setSubmit2(form){
		
		form.epona.value = form.epona1.checked + form.epona2.checked + form.epona3.checked;
		
		form.action = "/content/charWeeklyPro";
		return true;
	}
</script>