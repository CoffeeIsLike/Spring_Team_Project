<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Pave the way</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
		<%-- bootstrap --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
		<style>
			.content{
				border: 1px dotted gray;
			}
			
			/* 댓글 프로필 이미지를 작은 원형으로 만든다. */
			.profile-image{
				width: 50px;
				height: 50px;
				border: 1px solid #cecece;
				border-radius: 50%;
			}
			/* ul 요소의 기본 스타일 제거 */
			.comments ul{
				padding: 0;
				margin: 0;
				list-style-type: none;
			}
			.comments dt{
				margin-top: 5px;
			}
			.comments dd{
				margin-left: 50px;
			}
			.comment-form textarea, .comment-form button{
				float: left;
			}
			.comments li{
				clear: left;
			}
			.comments ul li{
				border-top: 1px solid #888;
			}
			.comment-form textarea{
				width: 84%;
				height: 100px;
			}
			.comment-form button{
				width: 14%;
				height: 100px;
			}
			/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
			.comments .comment-form{
				display: none;
			}
			/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
			.comments li{
				position: relative;
			}
			.comments .reply-icon{
				position: absolute;
				top: 1em;
				left: 1em;
				color: red;
			}
			pre {
			  display: block;
			  padding: 9.5px;
			  margin: 0 0 10px;
			  font-size: 13px;
			  line-height: 1.42857143;
			  color: #333333;
			  word-break: break-all;
			  word-wrap: break-word;
			  background-color: #f5f5f5;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			}	
			
			.loader{
				/* 로딩 이미지를 가운데 정렬하기 위해 */
				text-align: center;
				/* 일단 숨겨 놓기 */
				display: none;
			}	
			
			.loader svg{
				animation: rotateAni 1s ease-out infinite;
			}
			
			@keyframes rotateAni{
				0%{
					transform: rotate(0deg);
				}
				100%{
					transform: rotate(360deg);
				}
	}
</style>
	</head>
	<body>
		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Pave the way!</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link " aria-current="page" href="${pageContext.request.contextPath }/home.do">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/shop/list.do?category=outer">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>
                    </ul>
                    <c:choose>
                    	<c:when test="${ empty sessionScope.id}">
                    		<button class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath }/users/loginform.do'">Login</button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px" onclick="location.href='${pageContext.request.contextPath }/users/signup_form.do'">SignUp</button>
                    	</c:when>
                    	<c:otherwise>
                    		<form class="d-flex">
                        		<a class="w-55 btn btn-outline-dark" href="${pageContext.request.contextPath }/cart/list.do"><i class="bi-cart-fill me-1"></i> Cart</a>
                    		</form>
                    		<button class="btn btn-outline-dark" style="margin-left:3px" onclick="location.href='${pageContext.request.contextPath }/users/info.do'">MyInfo</button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px"onclick="location.href='${pageContext.request.contextPath }/users/logout.do'">Logout</button>
                    	</c:otherwise>
                    </c:choose>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-1">
                <div class="text-center text-white">
                    <img src="${pageContext.request.contextPath}/resources/images/logo1.png" width="220" height="100"/>
                </div>
            </div>
        </header>
		<!-- Section-->
        <section class="py-5">
        	<div class="row">
        		<div class="col-2">
        			<div class="b-example-divider"></div>
					  	<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
						    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
						      <span class="fs-5 fw-semibold">MENU</span>
						    </a>
					    <ul class="list-unstyled ps-0">
					      	<li class="mb-1">
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true"
						         href="${pageContext.request.contextPath}/shop/list.do">
						         Shop
						        </button>
					        	<div class="collapse show" id="home-collapse">
							        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							        	<li><a href="${pageContext.request.contextPath }/shop/list.do?category=outer" class="link-dark rounded">Outer</a></li>
							            <li><a href="${pageContext.request.contextPath }/shop/list.do?category=top" class="link-dark rounded">Top</a></li>
							            <li><a href="${pageContext.request.contextPath }/shop/list.do?category=bottom" class="link-dark rounded">Bottom</a></li>
							            <li><a href="${pageContext.request.contextPath }/shop/list.do?category=etc" class="link-dark rounded">Etc</a></li>
							    	</ul>
					        	</div>
					      	</li>
					    </ul>
					</div>
        		</div>
        		<div class=col-8>
        			<center><h1>Info</h1></center>
        			<br />
        			<div class="row">
        				
        				<div class="col-7">
        					<center>
	        				<img src="${pageContext.request.contextPath}${dto.imagePath}" width="400px" height="500px"/>
	        				<br/>
	        				<img src="${pageContext.request.contextPath}${dto.infoImagePath}" width="400px" height="500px"/>
        					</center>
        				</div>
        				
        				
        			<div class="col-5 text-center">

				      
				        <div class="card mb-4 rounded-3 shadow-sm">
				          <div class="card-header py-3">
				            <h4 class="my-0 fw-normal">Order</h4>
				          </div>
				          <div class="card-body">
				            <ul class="list-unstyled mt-3 mb-5">
				              <li>상품이름 : ${dto.name }</li>
				              <li>수량 : ${dto.remainCount }</li>
				              <li>주문자 : ${sessionScope.id }</li>
				              <li>가격 : ₩<fmt:formatNumber  value="${dto.price }" pattern="#,###"/></li>
				            </ul>
				           	<td>
		        				<form name="form1" method="post" action="${pageContext.request.contextPath}/cart/insert.do">
			        				<input type="hidden" name="code" value="${dto.code }"/>
			        				<select name="amount">
			        					<c:forEach begin="1" end="10" var="i">
			        						<option value="${i}">${i}</option>
			        					</c:forEach>
			        				</select>&nbsp;개
			        				<button class="w-55 btn btn-outline-dark" type="submit">장바구니 담기</button>
		        				</form>
        					</td>
        					<br />
				            <td>
		        				<form name="form1" method="post" action="${pageContext.request.contextPath}/order/insert.do">
			        				<input type="hidden" name="code" value="${dto.code }"/>
			        				<select name="amount">
			        					<c:forEach begin="1" end="10" var="i">
			        						<option value="${i}">${i}</option>
			        					</c:forEach>
			        				</select>&nbsp;개
			        				
			        					<button class="w-55 btn btn-outline-dark" type="submit">결제하기</button>
			        				
			        				
		        				</form>
        					</td>
				          </div>
				        </div>


        			</div>
        		</div>
        			
        			
        			<center><h1>Review</h1></center>
        			<!-- 댓글 목록 -->
						<div class="comments">
							<ul>
								<c:forEach var="tmp" items="${commentList }">
									<c:choose>
										<c:when test="${tmp.deleted eq 'yes' }">
											<li>삭제된 리뷰 입니다.</li>
										</c:when>
										<c:otherwise>
											<c:if test="${tmp.num eq tmp.comment_group }">
												<li id="reli${tmp.num }">
											</c:if>
											<c:if test="${tmp.num ne tmp.comment_group }">
												<li id="reli${tmp.num }" style="padding-left:50px;">
													<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
							  							<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
													</svg>
											</c:if>
													<dl>
														<dt>
															<span>${tmp.writer }</span>
															<c:if test="${tmp.num ne tmp.comment_group }">
																@<i>${tmp.target_id }</i>
															</c:if>
															<span>${tmp.regdate }</span>
															<a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
															<c:if test="${ (id ne null) and (tmp.writer eq id) }">
																<a data-num="${tmp.num }" class="update-link" href="javascript:">수정</a>
																<a data-num="${tmp.num }" class="delete-link" href="javascript:">삭제</a>
															</c:if>
														</dt>
														<dd>
															<pre id="pre${tmp.num }">${tmp.content }</pre>						
														</dd>
													</dl>
													<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="comment_insert.do" method="post">
														<input type="hidden" name="ref_group" value="${dto.num }"/>
														<input type="hidden" name="target_id" value="${tmp.writer }"/>
														<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
														<textarea name="content"></textarea>
														<button type="submit">등록</button>
													</form>
												<c:if test="${tmp.writer eq id }">
													<form id="updateForm${tmp.num }" class="comment-form update-form" action="comment_update.do" method="post">
														<input type="hidden" name="num" value="${tmp.num }" />
														<textarea name="content">${tmp.content }</textarea>
														<button type="submit">수정</button>
													</form>
												</c:if>
												</li>		
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>		
						<div class="loader">
							<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
								  <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
							</svg>
						</div>
						<br />
						<!-- 원글에 댓글을 작성할 폼 -->
						<form class="comment-form insert-form" action="comment_insert.do" method="post">
							<!-- 원글의 글번호가 댓글의 ref_group 번호가 된다. -->
							<input type="hidden" name="ref_group" value="${dto.num }"/>
							<!-- 원글의 작성자가 댓글의 대상자가 된다. -->
							<input type="hidden" name="target_id" value="${dto.writer }"/>
					
							<textarea name="content">${empty id ? '리뷰 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
							<button type="submit">등록</button>
						</form>
					</div>
				</div>
				
					<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
					<script>
						
						//클라이언트가 로그인 했는지 여부
						let isLogin=${ not empty id };
						
						document.querySelector(".insert-form")
							.addEventListener("submit", function(e){
								//만일 로그인 하지 않았으면 
								if(!isLogin){
									//폼 전송을 막고 
									e.preventDefault();
									//로그인 폼으로 이동 시킨다.
									location.href=
										"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/inquiry/detail.do?num=${dto.num}";
								}
							});
						
						/*
							detail
					 페이지 로딩 시점에 만들어진 1 페이지에 해당하는 
							댓글에 이벤트 리스너 등록 하기 
						*/
						addUpdateFormListener(".update-form");
						addUpdateListener(".update-link");
						addDeleteListener(".delete-link");
						addReplyListener(".reply-link");
						
						
						//댓글의 현재 페이지 번호를 관리할 변수를 만들고 초기값 1 대입하기
						let currentPage=1;
						//마지막 페이지는 totalPageCount 이다.  
						let lastPage=${totalPageCount};
						
						//추가로 댓글을 요청하고 그 작업이 끝났는지 여부를 관리할 변수 
						let isLoading=false; //현재 로딩중인지 여부 
						
						/*
							window.scrollY => 위쪽으로 스크롤된 길이
							window.innerHeight => 웹브라우저의 창의 높이
							document.body.offsetHeight => body 의 높이 (문서객체가 차지하는 높이)
						*/
						window.addEventListener("scroll", function(){
							//바닥 까지 스크롤 했는지 여부 
							const isBottom = 
								window.innerHeight + window.scrollY  >= document.body.offsetHeight;
							//현재 페이지가 마지막 페이지인지 여부 알아내기
							let isLast = currentPage == lastPage;	
							//현재 바닥까지 스크롤 했고 로딩중이 아니고 현재 페이지가 마지막이 아니라면
							if(isBottom && !isLoading && !isLast){
								//로딩바 띄우기
								document.querySelector(".loader").style.display="block";
								
								//로딩 작업중이라고 표시
								isLoading=true;
								
								//현재 댓글 페이지를 1 증가 시키고 
								currentPage++;
								
								/*
									해당 페이지의 내용을 ajax 요청을 통해서 받아온다.
									"pageNum=xxx&num=xxx" 형식으로 GET 방식 파라미터를 전달한다. 
								*/
								ajaxPromise("ajax_comment_list.do","get",
										"pageNum="+currentPage+"&num=${dto.num}")
								.then(function(response){
									//json 이 아닌 html 문자열을 응답받았기 때문에  return response.text() 해준다.
									return response.text();
								})
								.then(function(data){
									//data 는 html 형식의 문자열이다. 
									console.log(data);
									// beforebegin | afterbegin | beforeend | afterend
									document.querySelector(".comments ul")
										.insertAdjacentHTML("beforeend", data);
									//로딩이 끝났다고 표시한다.
									isLoading=false;
									//새로 추가된 댓글 li 요소 안에 있는 a 요소를 찾아서 이벤트 리스너 등록 하기 
									addUpdateListener(".page-"+currentPage+" .update-link");
									addDeleteListener(".page-"+currentPage+" .delete-link");
									addReplyListener(".page-"+currentPage+" .reply-link");
									//새로 추가된 댓글 li 요소 안에 있는 댓글 수정폼에 이벤트 리스너 등록하기
									addUpdateFormListener(".page-"+currentPage+" .update-form");
									
									//로딩바 숨기기
									document.querySelector(".loader").style.display="none";
								});
							}
						});
						
						//인자로 전달되는 선택자를 이용해서 이벤트 리스너를 등록하는 함수 
						function addUpdateListener(sel){
							//댓글 수정 링크의 참조값을 배열에 담아오기 
							// sel 은  ".page-xxx  .update-link" 형식의 내용이다 
							let updateLinks=document.querySelectorAll(sel);
							for(let i=0; i<updateLinks.length; i++){
								updateLinks[i].addEventListener("click", function(){
									//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
									const num=this.getAttribute("data-num"); //댓글의 글번호
									document.querySelector("#updateForm"+num).style.display="block";
									
								});
							}
						}
						function addDeleteListener(sel){
							//댓글 삭제 링크의 참조값을 배열에 담아오기 
							let deleteLinks=document.querySelectorAll(sel);
							for(let i=0; i<deleteLinks.length; i++){
								deleteLinks[i].addEventListener("click", function(){
									//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
									const num=this.getAttribute("data-num"); //댓글의 글번호
									const isDelete=confirm("리뷰를 삭제 하시겠습니까?");
									if(isDelete){
										// gura_util.js 에 있는 함수들 이용해서 ajax 요청
										ajaxPromise("comment_delete.do", "post", "num="+num)
										.then(function(response){
											return response.json();
										})
										.then(function(data){
											//만일 삭제 성공이면 
											if(data.isSuccess){
												//댓글이 있는 곳에 삭제된 댓글입니다를 출력해 준다. 
												document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
											}
										});
									}
								});
							}
						}
						function addReplyListener(sel){
							//댓글 링크의 참조값을 배열에 담아오기 
							let replyLinks=document.querySelectorAll(sel);
							//반복문 돌면서 모든 링크에 이벤트 리스너 함수 등록하기
							for(let i=0; i<replyLinks.length; i++){
								replyLinks[i].addEventListener("click", function(){
									
									if(!isLogin){
										const isMove=confirm("로그인이 필요 합니다. 로그인 페이지로 이동 하시겠습니까?");
										if(isMove){
											location.href=
												"${pageContext.request.contextPath}/users/loginform.do?url=${pageContext.request.contextPath}/inquiry/detail.do?num=${dto.num}";
										}
										return;
									}
									
									//click 이벤트가 일어난 바로 그 요소의 data-num 속성의 value 값을 읽어온다. 
									const num=this.getAttribute("data-num"); //댓글의 글번호
									
									const form=document.querySelector("#reForm"+num);
									
									//현재 문자열을 읽어온다 ( "답글" or "취소" )
									let current = this.innerText;
									
									if(current == "답글"){
										//번호를 이용해서 댓글의 댓글폼을 선택해서 보이게 한다. 
										form.style.display="block";
										form.classList.add("animate__flash");
										this.innerText="취소";	
										form.addEventListener("animationend", function(){
											form.classList.remove("animate__flash");
										}, {once:true});
									}else if(current == "취소"){
										form.classList.add("animate__fadeOut");
										this.innerText="답글";
										form.addEventListener("animationend", function(){
											form.classList.remove("animate__fadeOut");
											form.style.display="none";
										},{once:true});
									}
								});
							}
						}
						function addUpdateFormListener(sel){
							//댓글 수정 폼의 참조값을 배열에 담아오기
							let updateForms=document.querySelectorAll(sel);
							for(let i=0; i<updateForms.length; i++){
								//폼에 submit 이벤트가 일어 났을때 호출되는 함수 등록 
								updateForms[i].addEventListener("submit", function(e){
									//submit 이벤트가 일어난 form 의 참조값을 form 이라는 변수에 담기 
									const form=this;
									//폼 제출을 막은 다음 
									e.preventDefault();
									//이벤트가 일어난 폼을 ajax 전송하도록 한다.
									ajaxFormPromise(form)
									.then(function(response){
										return response.json();
									})
									.then(function(data){
										if(data.isSuccess){
											/*
												document.querySelector() 는 html 문서 전체에서 특정 요소의 
												참조값을 찾는 기능
												
												특정문서의 참조값.querySelector() 는 해당 문서 객체의 자손 요소 중에서
												특정 요소의 참조값을 찾는 기능
											*/
											const num=form.querySelector("input[name=num]").value;
											const content=form.querySelector("textarea[name=content]").value;
											//수정폼에 입력한 value 값을 pre 요소에도 출력하기 
											document.querySelector("#pre"+num).innerText=content;
											form.style.display="none";
										}
									});
								});
							}
						}
					</script>

				</div>
					
				
			
		<%-- <script>
		   // card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
		   $(".img-wrapper").imgLiquid();
		</script> --%>
		</section>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Pave the way 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
