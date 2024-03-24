<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%

        out.print("<link rel='stylesheet' href='consulta.css'>");
    out.print("<div class='wrappercad'>");
        out.print("<div class='wrapper'>");

        out.print("<div class='bloco-container'>");
                out.print("<img src='logokk.png' alt=''>");
                    out.print("<h1>Consulta</h1>");



                    
        if(session.getAttribute("usuario") == null )
        {
            out.print("Conteudo de acesso restrito");
            out.print("<br><br>");
            out.print("<a href='login_para_consulta.html'>Fazer Login</a>");
        }

        else{

        out.print( "Bem vindo(a) " + session.getAttribute("usuario") );

        out.print( "<br>" );
        out.print( "<a href='logoutcad.jsp'>Logout</a>" );

        // Variaveis para o banco de dados
        String banco    = "pixelgames" ;
        String endereco = "jdbc:mysql://localhost:3306/" + banco ;
        String usuario  = "root";
        String senha    = "" ;

        String driver   = "com.mysql.jdbc.Driver" ;

        //Carregar o driver na memória
        Class.forName( driver ) ;

        //Cria a variavel para conectar com banco
        Connection conexao ;

        // Abrir a conexao com o banco
        conexao = DriverManager.getConnection(endereco, usuario, senha) ;

        String sql = "SELECT * FROM cadastro";

        // Cria o statement para executar o camando no banco
        PreparedStatement stm = conexao.prepareStatement( sql );

        ResultSet dados =  stm.executeQuery() ;
        

        out.print( "<table border=1>" ) ;
        while( dados.next()  ) 
        {
            out.print( "<tr>" ) ;
                out.print( "<td>" ) ;
                out.print( dados.getString("codigo") ) ;
                out.print( "</td>" ) ;

                out.print( "<td>" ) ;
                out.print( dados.getString("nome") ) ;
                out.print( "</td>" ) ;

                out.print( "<td>" ) ;
                out.print( dados.getString("sobrenome") ) ;
                out.print( "</td>" ) ;

                out.print( "<td>" ) ;
                out.print( dados.getString("apelido") ) ;
                out.print( "</td>" ) ;

                out.print( "<td>" ) ;
                out.print( dados.getString("email") ) ;
                out.print( "</td>" ) ;

                out.print( "<td>" ) ;
                out.print( dados.getString("senha") ) ;
                out.print( "</td>" ) ;            
            out.print( "</tr>" ) ;
        }

        out.print( "</table>" ) ;


        // out.print( "<select>" ) ;
        // while( dados.next()  ) 
        // {
        //     out.print( "<option>" ) ;
        //         out.print( dados.getString("nome") ) ;
        //     out.print( "</option>" ) ;
        // }
        // out.print( "</select>" ) ;
     
    }
        
   
    %>
</body>
</html>