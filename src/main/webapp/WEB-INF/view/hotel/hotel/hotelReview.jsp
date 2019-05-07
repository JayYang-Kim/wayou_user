<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
                    <!-- Room Review -->
                  <c:forEach var="dto" items="${listReview }">
                  <div>
            
                        <!-- Single Review Area -->
                      <div class="single-room-review-area d-flex align-items-center" style="border-bottom: 2px solid gray; " >
                            <div class="reviwer-thumbnail">
                                <img src="<%=cp%>/resources/images/bg-img/55.jpg" alt="">
                            </div>
                            
                            <div class="reviwer-content" >
                            
                                <div class="reviwer-title-rating d-flex align-items-center justify-content-between">
                                    <div class="reviwer-title" >
                                        <span>${sessionScope.member.userName }  &nbsp; |&nbsp; ${dto.created }</span>
                                        <div style="font-size: 10px; color: #1cc3b2; font-weight: border;">친절도 ${dto.star }</div>
                                        <div style="font-size: 10px; color: #1cc3b2; font-weight: border;">청결도 ★★★★★</div>
                                        <div style="font-size: 10px; color: #1cc3b2; font-weight: border;">편의성 ★★★★★</div>
                                        <div style="font-size: 10px; color: #1cc3b2; font-weight: border;">위치만족도 ★★★★★</div>
                                    </div>
                                </div>                             
                                 <p>${dto.content }</p>
                            </div>
                        </div>
              
                  </div>
                    </c:forEach>
                    					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
					   <tr height="35">
						<td align="center">
					        ${paging}
						</td>
					   </tr>
					</table>