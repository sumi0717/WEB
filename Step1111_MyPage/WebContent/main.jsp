<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usual Homepage</title>
<jsp:include page="/include_files/css_loading.jsp" />
</head>
<body>
<jsp:include page="/include_files/header.jsp" />

<div class="home_main">

   <div class="main">
      <h1>WLCOME TO MY PLACE</h1>
         <div class="container">
             <div class="row">
                 <div class="col-md-offset-5">
                     <div class="form-login">
                     <h2>WELCOME</h2>
                     <form action="login.jsp" method="post" id="myForm">
                        <input type="text" id="id" name="id" class="form-control input-sm chat-input" placeholder="ID" />
                        <br/>
                        <input type="password" id="pwd" name="pwd" class="form-control input-sm chat-input" placeholder="PASSWORD" />
                        <br/>
                           <div class="wrapper">
                              <span class="group-btn">     
                                  <button type="submit" class="btn btn-primary btn-md">login</button>
                                  <a href="users/signupform.jsp" class="btn btn-primary btn-md">signup</a>
                              </span>
                           </div>
                    </form>
                     </div>
                 </div>
             </div>
         </div>
    </div>
</div>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
   $("#myForm").ajaxForm(function(responseData){
      console.log(responseData);
      if(responseData.isSuccess){
         alert("로그인 되었습니다.");
      }else{
         alert("아이디 혹은 비밀번호가 틀려요!");
      }
   });
</script>
</body>
</html>