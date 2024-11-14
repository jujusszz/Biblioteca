package controller;

import dao.LivroDAO;
import model.Livro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/livro")
public class LivroServlet extends HttpServlet {
	private LivroDAO livroDAO;
       
	 public void init() {
	        livroDAO = new LivroDAO();
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String action = request.getParameter("action");
	        try {
	            switch (action) {
	                case "new":
	                    showNewForm(request, response);
	                    break;
	                case "insert":
	                    insertLivro(request, response);
	                    break;
	                case "delete":
	                    deleteLivro(request, response);
	                    break;
	                case "edit":
	                    showEditForm(request, response);
	                    break;
	                case "update":
	                    updateLivro(request, response);
	                    break;
	                case "searchById":
	                        searchLivroById(request, response);
	                        break;
	                default:
	                    listLivro(request, response);
	                    break;
	            }
	        } catch (SQLException ex) {
	            throw new ServletException(ex);
	        }
	    }

	    private void listLivro(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	        List<Livro> listLivro = livroDAO.selectAllLivros();
	        request.setAttribute("listLivro", listLivro);
	        request.getRequestDispatcher("livro-list.jsp").forward(request, response);
	    }
	    
	    private void searchLivroById(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        Livro livro = livroDAO.selectLivro(id);
	        if (livro != null) {
	            request.setAttribute("livro", livro);
	            request.getRequestDispatcher("livro-pesquisa.jsp").forward(request, response);
	        } else {
	            response.sendRedirect("livro?action=list");
	        }
	    }

	    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        request.getRequestDispatcher("livro-form.jsp").forward(request, response);
	    }

	    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        Livro existingLivro = livroDAO.selectLivro(id);
	        request.setAttribute("livro", existingLivro);
	        request.getRequestDispatcher("livro-form.jsp").forward(request, response);
	    }

	    private void insertLivro(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        String titulo = request.getParameter("titulo");
	        String autor = request.getParameter("autor");
	        LocalDate dataPublicacao = LocalDate.parse(request.getParameter("dataPublicacao"));
	        String local = request.getParameter("local");
	        Livro novoLivro = new Livro(titulo, autor, dataPublicacao, local);
	        livroDAO.insertLivro(novoLivro);
	        response.sendRedirect("livro?action=list");
	    }

	    private void updateLivro(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        String titulo = request.getParameter("titulo");
	        String autor = request.getParameter("autor");
	        LocalDate dataPublicacao = LocalDate.parse(request.getParameter("dataPublicacao"));
	        String local = request.getParameter("local");

	        Livro livro = new Livro(titulo, autor, dataPublicacao, local);
	        livro.setId(id);
	        livroDAO.updateLivro(livro);
	        response.sendRedirect("livro?action=list");
	    }

	    private void deleteLivro(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        livroDAO.deleteLivro(id);
	        response.sendRedirect("livro?action=list");
	    }
	}