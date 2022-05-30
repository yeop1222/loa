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
    


<form onsubmit="return setSubmit(this)" method="post" name="frmwd">
	<table class="table">
		<tr>
			<th>
				모험의 섬
			</th>
			<c:if test="${day==0 || day==6}">
				<td class="align-middle" colspan="2">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="islands" value="2" ${co.island>=2?"checked":"" }/>
							모험의섬(주말)
						</label>
					</div>
				</td>
			</c:if>
			<td class="align-middle" colspan="${day==0||day==6?2:4}">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="islands" value="1" ${co.island%2==1?"checked":"" }/>
						모험의섬
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				비탄의 섬
			</th>
			<td class="align-middle" colspan="4">
				<div class="form-check-inline">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="bitan" value="1" ${co.bitan==1? "checked":"" }/>
						비탄의 섬
					</label>
				</div>
			</td>
		</tr>
		<tr>
			<th width="30%">NPC명</th>
			<th width="18%">노래1</th>
			<th width="17%">노래2</th>
			<th width="18%">감정1</th>
			<th width="17%">감정2</th>
		</tr>
		<c:forEach var="i" begin="0" end="${npcList.size()-1 }">
			<c:set var="dto" value="${npcList[i]}" />
			<input type="hidden" name="npc${i}" value="${dto.name}"/>
			<tr>
				<td class="align-middle" >
					&nbsp;&nbsp;&nbsp;${dto.name}
				</td>
				<td class="align-middle">
					<c:if test="${dto.song1 != null}">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input" name='${"npcv" += i}' value="8"
									${co.npcValue % Math.pow(2,4*i+4) / Math.pow(2,4*i+3) >=1 && co.npcValue % Math.pow(2,4*i+4) / Math.pow(2,4*i+3) <=2 ? "checked":""}/>
							</label>
						</div>
					</c:if>
				</td>
				<td class="align-middle">
					<c:if test="${dto.song2 != null}">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input" name='${"npcv" += i}' value="4"
									${co.npcValue % Math.pow(2,4*i+3) / Math.pow(2,4*i+2) >=1 && co.npcValue % Math.pow(2,4*i+3) / Math.pow(2,4*i+2) <=2 ? "checked":""}/>
							</label>
						</div>
					</c:if>
				</td>
				<td class="align-middle">
					<c:if test="${dto.emote1 != null}">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input" name='${"npcv" += i}' value="2"
									${co.npcValue % Math.pow(2,4*i+2) / Math.pow(2,4*i+1) >=1 && co.npcValue % Math.pow(2,4*i+2) / Math.pow(2,4*i+1) <=2 ? "checked":""}/>
							</label>
						</div>
					</c:if>
				</td>
				<td class="align-middle">
					<c:if test="${dto.emote2 != null}">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input" name='${"npcv" += i}' value="1"
									${co.npcValue % Math.pow(2,4*i+1) / Math.pow(2,4*i) >=1 && co.npcValue % Math.pow(2,4*i+1) / Math.pow(2,4*i) <=2 ? "checked":""}/>
							</label>
						</div>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		
		<!-- 요일별 컨텐츠 -->
		<c:if test="${day==0 || day== 1 || day==4 || day==6}">
			<tr>
				<th>
					카오스게이트
				</th>
				<td class="align-middle" colspan="4">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="chaosGate" value="1" ${co.chaosGate==1?"checked":"" }/>
							카오스게이트
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${day==0 || day==2 || day==5}">
			<tr>
				<th>
					필드보스
				</th>
				<td class="align-middle" colspan="4">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="boss" value="1" ${co.boss==1?"checked":"" }/>
							필드보스
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${day==0 || day==6}">
			<tr>
				<th>
					주말 점령전
				</th>
				<td class="align-middle" colspan="4">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="pkIsland" value="1" ${co.pkIsland==1?"checked":"" }/>
							점령전
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${day==2 || day==4 || day==6}">
			<tr>
				<th>
					유령선
				</th>
				<td class="align-middle" colspan="4">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="ghostShip" value="1" ${co.ghostShip==1?"checked":"" }/>
							유령선
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<c:if test="${day==1 || day==4 || day==6}">
			<tr>
				<th>
					로웬 습격전
				</th>
				<td class="align-middle" colspan="${day==6?2:4 }">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="rowens" value="1" ${co.rowen%2==1?"checked":"" }/>
							<c:if test="${day==6 }">
								로웬 15:30
							</c:if>
							<c:if test="${day==1 || day==4 }">
								로웬 20:30
							</c:if>
						</label>
					</div>
				</td>
				<c:if test="${day==6}">
					<td class="align-middle" colspan="2">
						<div class="form-check-inline">
							<label class="form-check-label">
								<input type="checkbox" class="form-check-input" name="rowens" value="2" ${co.rowen>=2?"checked":"" }/>
								로웬 22:30
							</label>
						</div>
					</td>
				</c:if>
			</tr>
		</c:if>
		<c:if test="${day==0 || day==3 || day==6}">
			<tr>
				<th>
					툴루비크
				</th>
				<td class="align-middle" colspan="4">
					<div class="form-check-inline">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="thulubik" value="1" ${co.thulubik==1?"checked":"" }/>
							툴루비크 전장
						</label>
					</div>
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5">
				<input type="submit" value="저장" class="btn btn-outline-dark">
			</td>
		</tr>
	</table>
	<input type="hidden" name="island" value="0"/>
	<input type="hidden" name="npcValue" value="0"/>
	<input type="hidden" name="rowen" value="0"/>
	<input type="hidden" name="charOpt" value="${charOpt }"/>
	<input type="hidden" name="charOpt2" value="${charOpt2 }"/>
</form>



<c:if test="${day==0 || day==6}">
	<c:if test="${co.island >= 2}">
		<script>
			document.frmwd.islands[0].checked = true;
		</script>
	</c:if>
	<c:if test="${co.island%2==1}">
		<script>
			document.frmwd.islands[1].checked = true;
			</script>
	</c:if>
</c:if>
<c:if test="${day==6}">
	<c:if test="${co.rowen>=2}">
		<script>
			document.frmwd.rowens[1].checked = true;
		</script>
	</c:if>
	<c:if test="${co.rowen%2==1}">
		<script>
			document.frmwd.rowens[0].checked = true;
		</script>
	</c:if>
</c:if>





<script>


	function setSubmit(form){
		
		//모험의섬
		if(${day==0 || day==6}){
			for(var i=0; i<form.islands.length; i++){
				form.island.value = form.island.value*1+form.islands[i].checked*form.islands[i].value*1;
			}
		}else{
			form.island.value = form.islands.value;
		}
		
		//로웬은 토요일만 두개
		if(${day==6}){
			for(var i=0; i<form.rowens.length; i++){
				form.rowen.value = form.rowen.value*1+form.rowens[i].checked*form.rowens[i].value*1;
			}
		}else if(${day==1 || day==4}){
			form.rowen.value = form.rowens.value;
		}
		
		//npc
		for(var i=${npcList.size()-1}; i>=0; i--){
			//alert(i + "" + eval("form.npcv"+i+".value"));
			form.npcValue.value *= 16;
			for(var j=0; j<eval("form.npcv"+i+".length"); ++j){
				form.npcValue.value = form.npcValue.value*1 + eval("form.npcv"+i+"["+j+"].value")*1
										*eval("form.npcv"+i+"["+j+"].checked");
			}
		}
		
		form.action = "/content/wonDailyPro";
		return true;
	}
</script>