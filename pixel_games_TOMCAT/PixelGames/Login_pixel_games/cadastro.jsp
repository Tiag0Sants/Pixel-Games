<%@page language="java" import="java.sql.*"%>

<%
//criar variaveis para armazenar as informações do cadastro
String vnome= request.getParameter("text_Nome");

String vsobrenome= request.getParameter("text_Sobrenome");

String vapelido= request.getParameter("text_apelido");

String vemail= request.getParameter("text_email");

String vsenha= request.getParameter("text_senha");


//variaveis do bando

String banco = "pixelgames";
String endereco = "jdbc:mysql://localhost:3306/"+ banco;
String usuario = "root";
String senha = "";

//variavel do drive
String driver = "com.mysql.jdbc.Driver";

//carregar o driver na memoria
Class.forName(driver);

//criar a variavel para conectar com o banco de dados
Connection conexao;

//abrir a conexão com o banco

conexao=DriverManager.getConnection(endereco, usuario, senha);

//criar a variavel para o comando INSERT
String sql = "INSERT INTO cadastro (Nome, sobrenome, Apelido, Email, Senha) values (?, ?, ?, ?, ?)";

PreparedStatement stm = conexao.prepareStatement(sql);
stm.setString(1,vnome);
stm.setString(2,vsobrenome);
stm.setString(3,vapelido);
stm.setString(4,vemail);
stm.setString(5,vsenha);

stm.execute();
stm.close();

response.sendRedirect("Login.html");
%>
