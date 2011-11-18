package br.com.youlearn.imagens;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;
import br.com.youlearn.modelo.Curso;

@Component
public class ImagemCurso {

	private File pastaImagem;
	
	public ImagemCurso(ServletContext context) {
		String caminho = context.getRealPath("/WEB-INF/imagens/courses");
		pastaImagem = new File(caminho);
		pastaImagem.mkdir();
	}
	
	public void upload(UploadedFile file, Curso curso) {
		File destino = new File(pastaImagem, curso.getId() + ".imagem");
		
		try {
			IOUtils.copyLarge(file.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
			throw new RuntimeException("Erro ao copiar imagem: " + e);
		}
	}
	
	public File mostra(Curso curso) {
		File file = new File(pastaImagem, curso.getId() + ".imagem");
		return (file.exists()) ? file : new File(pastaImagem, "defaultcourse.jpg");
	}
	
}
