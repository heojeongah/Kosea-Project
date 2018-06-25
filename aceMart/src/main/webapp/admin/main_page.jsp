<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %> 
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="card card-stats">
                <div class="card-header" data-background-color="red">
                    <i class="material-icons">info_outline</i>
                </div>
                <div class="card-content">
                    <p class="category">신규 주문</p>
                    <h3 class="title">${countNewOrder}</h3>
                    <p class="category">입금대기</p>
                    <h3 class="title">${countWaitingPay}</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">update</i> Just Updated
                    </div>
                </div>
            </div>
        </div>
          <div class="col-md-6">
            <div class="card">
                <div class="card-header card-chart" data-background-color="green">
                    <div class="ct-chart" id="dailySalesChart"></div>
                </div>
                <div class="card-content">
                    <h4 class="title">Daily Sales</h4>
                    <p class="category">
                        <span class="text-success"><i class="fa fa-long-arrow-up"></i>55</span> increase in today sales.</p>
                </div>
            </div>
        </div>
        
        
    </div>
    <div class="row">
      <div class="col-md-4">
            <div class="card card-stats">
                <div class="card-header" data-background-color="blue">
                    <i class="material-icons">local_shipping</i>
                </div>
                <div class="card-content">
                    <p class="category">배송준비중</p>
                    <h3 class="title">${state1 }</h3>
                    <p class="category">배송중</p>
                    <h3 class="title">${state2 }</h3>
                </div>
                <div class="card-footer">
                    <div class="stats">
                        <i class="material-icons">update</i> Just Updated
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header" data-background-color="orange">
                    <h4 class="title">QnA</h4>
                </div>
                <div class="card-content table-responsive">
                  <table class="table table-hover">
                          <thead class="text-warning">
							<tr>
								<th>답변상태</th><th>글제목</th><th>작성자ID</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
					<c:if test="${ !empty LIST }">
					<c:forEach var="writing" items="${LIST }">
					<tr>
						<td>${writing.w_state }</td>
						<td>
						${writing.title }</td>
						<td>${writing.c_id }</td>
						<td>${writing.w_date }</td>
					</tr>
					</c:forEach>
					</c:if>
					</tbody>
					</table>
                </div>
            </div>
        </div>

    </div>
</div>
