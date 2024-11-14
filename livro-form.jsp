<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cadastro de Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            width: 90%;
            max-width: 700px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .welcome-section {
            background-color: #6a0dad;
            color: #ffffff;
            padding: 30px;
            width: 40%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .welcome-section h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .welcome-section p {
            font-size: 14px;
            margin-bottom: 20px;
        }
        .welcome-section .btn {
            background-color: #ffffff;
            color: #6a0dad;
            padding: 10px 20px;
            border: 2px solid #ffffff;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }
        .welcome-section .btn:hover {
            background-color: #6a0dad;
            color: #6a0dad;
        }
        .form-section {
            width: 60%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .form-section h2 {
            color: #6a0dad;
            margin-bottom: 20px;
            font-size: 22px;
        }
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            display: none; 
        }
        input[type="text"], input[type="date"] {
            padding: 12px;
            border-radius: 6px;
            border: 1px solid #ddd;
            width: 100%;
            box-sizing: border-box;
            background-color: #f0f0f5;
        }
        input[type="submit"] {
            background-color: #6a0dad;
            color: #ffffff;
            padding: 12px;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #6a0def;
        }
        .cancel-link {
            display: block;
            margin-top: 15px;
            color: #e0e0ff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }
        .cancel-link:hover {
            color: #d8b9ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome-section">
            <h2>Cadastre seu livro!</h2>
        </div>
        
        <div class="form-section">
            <h2>Insira os dados</h2>
            <form action="${pageContext.request.contextPath}/livro?action=${livro != null ? 'update' : 'insert'}" method="post">
                <input type="hidden" name="id" value="${livro != null ? livro.id : ''}" />
                <input type="text" id="titulo" name="titulo" value="${livro != null ? livro.titulo : ''}" required placeholder="Título do livro"/>
                <input type="text" id="autor" name="autor" value="${livro != null ? livro.autor : ''}" required placeholder="Autor"/>
                <input type="date" id="dataPublicacao" name="dataPublicacao" value="${livro != null ? livro.dataPublicacao : ''}" required placeholder="Data de Publicação"/>
                <input type="text" id="local" name="local" value="${livro != null ? livro.local : ''}" required placeholder="Local da publicação"/>
                
                <input type="submit" value="Cadastrar" />
            </form>
        <a href="livro?action=list" class="cancel-link">Cancelar</a>
        
        </div>
    </div>
</body>
</html>
