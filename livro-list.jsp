<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Lista de Livros</title>
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
        .new-book-btn {
            display: inline-block;
            margin-bottom: 15px;
            padding: 10px 20px;
            background-color: #6a0dad;
            color: #ffffff;
            text-decoration: none;
            border-radius: 20px;
            font-weight: bold;
            text-align: center;
            transition: background-color 0.3s;
        }
        .new-book-btn:hover {
            background-color: #5a009e;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #6a0dad;
            color: #ffffff;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .action-links a {
            color: #6a0dad;
            text-decoration: none;
            font-weight: bold;
            margin: 0 5px;
        }
        .action-links a:hover {
            color: #5a009e;
        }
        .search-form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .search-form input {
            padding: 10px;
            font-size: 16px;
            border-radius: 20px;
            border: 1px solid #ddd;
            margin-right: 10px;
            width: 300px;
        }
        .search-form button {
            padding: 10px 20px;
            background-color: #6a0dad;
            color: white;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .search-form button:hover {
            background-color: #5a009e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lista de Livros</h1>
        <form action="livro" method="get" class="search-form">
            <input type="text" name="id" placeholder="Digite o ID do livro" required>
            <button type="submit" name="action" value="searchById">Buscar</button>
        </form>

        <a href="livro?action=new" class="new-book-btn">Novo Livro</a>
        <table>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Data de Publicação</th>
                <th>Local</th>
                <th>Ações</th>
            </tr>
            <c:forEach var="livro" items="${listLivro}">
                <tr>
                    <td>${livro.id}</td>
                    <td>${livro.titulo}</td>
                    <td>${livro.autor}</td>
                    <td>${livro.dataPublicacao}</td>
                    <td>${livro.local}</td>
                    <td class="action-links">
                        <a href="livro?action=edit&id=${livro.id}">Editar</a> | 
                        <a href="livro?action=delete&id=${livro.id}">Deletar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
