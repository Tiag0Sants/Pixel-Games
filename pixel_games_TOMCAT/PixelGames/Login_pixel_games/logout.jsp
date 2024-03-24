<%

  if( session != null ){
    session.invalidate() ;
    response.sendRedirect("Login.html");
  }


%>