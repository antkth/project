<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
	<div class="container"> 
		<form id="commentForm" name="commentForm" method="post">
		<br><br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td>
								<textarea style="width: 1100px" rows="3" cols="30" id="comment" name="content" placeholder="댓글을 입력하세요." ></textarea>
								<br>
								<div>
									<a href="#" onclick="fn_comment('${result.code}')" class="btn pull-right btn-success" >등록</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" id="num" name="num" value="${result.code}" >
		</form>
	</div>
	<div class="container">
		<form id="commentListForm" name="commentListForm" method="post" >
			<div id="commentList">
			</div>
		</form>
	</div>
	
	<script>
		
		function fn_comment(code){
			
			$.ajax({
				type:'POST',
				url : "/reviewAdd.rev",
				data : $("#commentForm").serialize(),
				success : function(data){
					if(data =="success"){
						getCommentList();
						$("#comment").val("");
					}
				},
				error:function(request,status,error){
					alert("Error!");
				}
			});
		}
	
		
		$(function(){
			getCommentList();
		});
		
		function getCommentList(){
			
			$.ajax({
				type:'GET',
				url : '/reviewList.rev',
				dataType : "json",
				data:$("#commentForm").serialize(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data){
					
					var html ="";
					var cCnt = data.length;
					
					if(data.length > 0){
						
						for(i=0; i<data.length; i++){
							html += "<div>";
							html += "<div><table class='table'><h6><strong>"+data[i].id+"</strong></h6>";
							html += data[i].content + "<tr><td></td></tr>";
							html += "</table></div>";
							html += "</div>";
						}
					}else{
						
						html += "<div>";
						html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
						html += "</table></div>";
						html += "</div>";
					}
					
					$("#cCnt").html(cCnt);
					$("#commentList").html(html);
				}
				
			});
		}
	</script>
	
</body>
</html>