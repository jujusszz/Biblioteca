<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalhes do Livro</title>
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
            width: 90%;
            max-width: 900px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        h1 {
            color: #6a0dad;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .book-details {
            font-size: 18px;
            margin-top: 20px;
        }
        .book-details p {
            margin: 10px 0;
        }
        .book-details strong {
            color: #6a0dad;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6a0dad;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            font-weight: bold;
            text-align: center;
            transition: background-color 0.3s;
        }
        .back-link:hover {
            background-color: #5a009e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Detalhes do Livro</h1>
        <c:if test="${livro != null}">
            <div class="book-details">
                <p><strong>ID:</strong> ${livro.id}</p>
                <p><strong>Título:</strong> ${livro.titulo}</p>
                <p><strong>Autor:</strong> ${livro.autor}</p>
                <p><strong>Data de Publicação:</strong> ${livro.dataPublicacao}</p>
                <p><strong>Local:</strong> ${livro.local}</p>
            </div>
        </c:if>
        <a href="livro?action=list" class="back-link">Voltar para a lista</a>
    </div>
</body>
</html>
