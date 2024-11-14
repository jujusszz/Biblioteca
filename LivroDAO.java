package dao;

import model.Livro;
import java.sql.*;
import java.util.ArrayList;
import java.time.LocalDate;
import java.util.List;

public class LivroDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/biblioteca";
    private String jdbcUsername = "root"; 
    private String jdbcPassword = "jd95852504JAY";

    private static final String INSERT_LIVRO_SQL = "INSERT INTO livro (titulo, autor, dataPublicacao, local) VALUES (?, ?, ?, ?)";
    private static final String SELECT_LIVRO_BY_ID = "SELECT id, titulo, autor, dataPublicacao, local FROM livro WHERE id = ?";
    private static final String SELECT_ALL_LIVROS = "SELECT * FROM livro";
    private static final String DELETE_LIVRO_SQL = "DELETE FROM livro WHERE id = ?";
    private static final String UPDATE_LIVRO_SQL = "UPDATE livro SET titulo =?, autor =?, dataPublicacao =?, local =?  WHERE id =?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertLivro(Livro livro) throws SQLException {
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LIVRO_SQL)) {
            preparedStatement.setString(1, livro.getTitulo());
            preparedStatement.setString(2, livro.getAutor());
            preparedStatement.setDate(3, java.sql.Date.valueOf(livro.getDataPublicacao()));
            preparedStatement.setString(4, livro.getLocal());
            preparedStatement.executeUpdate();
        }
    }

    public Livro selectLivro(int id) {
        Livro livro = null;
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LIVRO_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                LocalDate dataPublicacao = rs.getDate("dataPublicacao").toLocalDate();
                String local = rs.getString("local");
                livro = new Livro(titulo, autor, dataPublicacao, local);
                livro.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livro;
    }

    public List<Livro> selectAllLivros() {
        List<Livro> livros = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LIVROS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                LocalDate dataPublicacao = rs.getDate("dataPublicacao").toLocalDate();
                String local = rs.getString("local");
                Livro livro = new Livro(titulo, autor, dataPublicacao, local);
                livro.setId(id);
                livros.add(livro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livros;
    }

    public boolean updateLivro(Livro livro) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_LIVRO_SQL)) {
            statement.setString(1, livro.getTitulo());
            statement.setString(2, livro.getAutor());
            statement.setDate(3, java.sql.Date.valueOf(livro.getDataPublicacao()));
            statement.setString(4, livro.getLocal());
            statement.setInt(5, livro.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean deleteLivro(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_LIVRO_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

}
