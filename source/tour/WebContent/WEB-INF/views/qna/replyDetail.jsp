<%@page import="vo.MemberVO"%>
<%@page import="vo.AdminVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    List<QnaVO> qnaList = (List<QnaVO>) request.getAttribute("qnaList");
    QnaVO qv = (QnaVO) request.getAttribute("qv");
    MemberVO id2 = (MemberVO) session.getAttribute("memberVO");
	AdminVO id =(AdminVO) session.getAttribute("adminVO");
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>답변글 상세 페이지</title>



</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="sub">
		<jsp:include page="../../includes/header.jsp" />
		<jsp:include page="../../includes/subVisual.jsp" />
		<div id="content" >
	
	
			<div id="bo_v_top">
				<ul class="btn_bo_user bo_v_com">
				
				</ul>

				<script>
            jQuery(function ($) {
                // 게시판 보기 버튼 옵션
                $(".btn_more_opt.is_view_btn").on("click", function (e) {
                    e.stopPropagation();
                    $(".more_opt.is_view_btn").toggle();
                });
                $(document).on("click", function (e) {
                    if (!$(e.target).closest('.is_view_btn').length) {
                        $(".more_opt.is_view_btn").hide();
                    }
                });
            });
        </script>
			</div>
			<%-- 제목 부분 --%>
			<div class="post_wrap">
				<h2 id="bo_v_title" class="post_tit">
					<span class="bo_v_tit"> <%= qv.getQnaTitle() %></span>
				</h2>
				<div class="post_info">
					<ul>
						<li>작성자 : <span class="sv_member"><%= qv.getMemNm() %><br></span></li>
						<li>작성일 : <%= qv.getQnaDate() %></li>
						<li>문의상태 : <%= qv.getQnaStatus() %></li>
					</ul>
				</div>
			</div>

			<%-- 내용 부분 --%>

			<section id="bo_v_atc" class="post_con">
				<div id="bo_v_img"></div>

				<%-- 본문 내용 시작 --%>
				<div id="bo_v_con">
					<%= qv.getQnaContent() %> 
					<div id="bo_v_share"></div>
				</div>
				<%-- 본문 내용 끝 --%>
			</section>
			
			
			
			
			
			<!--  댓글 시작  -->
			<section id="bo_vc" class="reply-section">
			
			<!-- 제목 출력  -->
   <%--   <h2><%= qv.getReplyTitle() %></h2>  --%>
     <h2> ${requestScope.qv.replyTitle}</h2> 
    
	<article id="c_633">
        
        <div class="reply_wrap">
			<div class="reply_tit">
				작성자 : <span class="member" ><%= qv.getAdminNm() %></span> | 작성일 : ${requestScope.qv.replyDate }
			</div>	           
				
	        <!-- 댓글 출력 -->
	        <div class="reply_con">
								 ${requestScope.qv.replyContent} 	        </div>
	        <span id="edit_633" class="bo_vc_w"></span><!-- 수정 -->
	        <span id="reply_633" class="bo_vc_w"></span><!-- 답변 -->
	
	        <input type="hidden" value="" id="secret_comment_633">
	        <textarea id="save_comment_633" style="display:none"></textarea>
		</div>
		
		
          <!--       <script>
			$(function() {			    
		    // 댓글 옵션창 열기
		    $(".btn_cm_opt").on("click", function(){
		        $(this).parent("div").children(".bo_vc_act").show();
		    });
				
		    // 댓글 옵션창 닫기
		    $(document).mouseup(function (e){
		        var container = $(".bo_vc_act");
		        if( container.has(e.target).length === 0)
		        container.hide();
		    });
		});
		</script> -->
		
		
    </article>
        
</section>
<!-- // 댓글  -->
			
			
		  <ul class="btn_wrap txt_r">
             <%if(id==null || "".equals(id)){%>
              <li><a href="/tour/qna.do"
               class="btn btn-blue" title="목록"></a></li>
            <%}else{%>
            <li><a class="btn btn-line"
               href="/tour/replyWrite.do?qnaCode=<%= qv.getQnaCode() %>">답변 등록</a></li>
              <li><a class="btn btn-line"
               href="/tour/replyUpdate.do?qnaCode=<%= qv.getQnaCode() %>">답변 수정</a></li>
            <li><a class="btn btn-line"
               href="/tour/replyDelete.do?qnaCode=<%= qv.getQnaCode() %>">답변 삭제</a></li>
            <li><a href="/tour/qna.do"
              class="btn btn-blue" title="목록">목록</a></li>
            <% } %>
         </ul> 	
			
 		
 		
 		
  </div>
		
		
		</div>
		<jsp:include page="../../includes/footer.jsp" />
	</div>


</body>
</html>