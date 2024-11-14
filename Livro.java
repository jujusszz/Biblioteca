package model;

import java.time.LocalDate;

public class Livro {
	private int id;
    private String titulo;
    private String autor;
    private LocalDate dataPublicacao;
    private String local;

    public Livro() {}
    public Livro(String titulo, String autor, LocalDate anoPublicacao, String local) {
        this.titulo = titulo;
        this.autor = autor;
        this.dataPublicacao = anoPublicacao;
        this.local = local;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public LocalDate getDataPublicacao() {
		return dataPublicacao;
	}

	public void setAnoPublicacao(LocalDate dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}
}
