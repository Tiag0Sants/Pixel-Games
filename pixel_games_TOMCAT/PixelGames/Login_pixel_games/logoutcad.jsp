<%

  if( session != null ){
    session.invalidate() ;
    response.sendRedirect("login_para_consulta.html");
  }


%>