<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


  <!-- image start -->
   <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(img/bg-img/16.jpg);">
       <div class="container h-100">
           <div class="row h-100 align-items-center">
               <div class="col-12">
                   <div class="breadcrumb-content text-center">
                       <h2 class="page-title">등급확인</h2>
                       <nav aria-label="breadcrumb">
                           <ol class="breadcrumb justify-content-center">
                               <li class="breadcrumb-item"><a href="#">Home</a></li>
                               <li class="breadcrumb-item active" aria-current="page">ticket</li>
                           </ol>
                       </nav>
                   </div>
               </div>
           </div>
       </div>
   </div>
   <!-- image End -->



	          
  <!-- step type  Start -->
 <div class="container">
     <div class="row">
     	  <div class="col-12 col-lg-4 mr-10">
             <!-- Hotel Reservation Area -->
             <div class="hotel-reservation--area mb-100">
                 <form action="#" method="post">
                     <div class="form-group mr-10 mb-30">
                         <label for="regionSearch">등급 종류</label>
                        
                     </div>
                 </form>
             </div>
         </div>

          <div class="col-12 col-lg-4">
          <div style="text-align: right; font-size: 20px; margin-bottom: 20px;">내 등급</div>
             <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                 <!-- Room Thumbnail -->
                 <div class="room-thumbnail">
                     <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" alt="">
                   </div>
           </div>
		</div>
		
		  <div class="col-12 col-lg-4">
          <div style="text-align: right; font-size: 20px; margin-bottom: 20px;">등급 올리는 방법</div>
             <div class="single-room-area d-flex align-items-center mb-50 wow fadeInUp" data-wow-delay="100ms">
                 <!-- Room Thumbnail -->
                 <div class="room-thumbnail">
                     <img src="<%=cp%>/resources/images/bg-img/everland.jpeg" alt="">
                   </div>
           </div>
		</div>
	</div>
</div>
  <!-- step type End -->
