package br.com.youlearn.imagens;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;
import br.com.youlearn.modelo.Usuario;

@Component
public class ImagemUsuario {

	private File pastaImagem;
	
	public ImagemUsuario(ServletContext context) {
		String caminho = context.getRealPath("/WEB-INF/imagens/users");
		pastaImagem = new File(caminho);
		pastaImagem.mkdir();
	}
	
	public void upload(UploadedFile file, Usuario usuario) {
		File destino = new File(pastaImagem, usuario.getId() + ".imagem");
		
		try {
			IOUtils.copyLarge(file.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
			throw new RuntimeException("Erro ao copiar imagem: " + e);
		}
	}
	
	public File mostra(Usuario usuario) {
		File file = new File(pastaImagem, usuario.getId() + ".imagem");
		return (file.exists()) ? file : new File(pastaImagem, "default.png");
	}
	
}
