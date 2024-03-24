<%@page language="java" import="java.sql.*"%>

<%

    String vlogin = request.getParameter("textemail");

    String vsenha = request.getParameter("textsenha");


    // Variaveis para o banco de dados
    String banco = "pixelgames";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

    //variavel do driver

    String driver = "com.mysql.jdbc.Driver";

    //Carregar o driver na memória

    Class.forName(driver);

    //Criar a variavel para conectar com banco
    Connection conexao;

    //Abrir a conexão com o banco
    conexao = DriverManager.getConnection (endereco, usuario, senha);

    String sql = "SELECT * FROM cadastro WHERE email=? AND senha=?";

    // Cria o statement para executar o comando no banco

    PreparedStatement stm = conexao.prepareStatement( sql );

    stm.setString(1, vlogin);
    stm.setString(2, vsenha);


    ResultSet dados = stm.executeQuery();
    


    if(dados.next())
    {
        session.setAttribute("usuario", dados.getString("nome") ); 

        response.sendRedirect ("../pixel_game.html");
    }


    else{
        response.sendRedirect("Login.html");
    }

    %>

    
