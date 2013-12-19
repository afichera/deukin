package com.deukin

import com.deukin.exceptions.BusinessException

/**
 * Representa los servicios para validar la carga de archivos en el sistema.
 * @author Ale Mobile
 * @since 19/12/2013
 */
class UploadService {

	/**
	 * Valida que el archivo tenga formato de texto.
	 * Lo hace validando su extesión y no su contenido.
	 * Si el formato es TXT, ODT, RTF, DOC, DOCX, PDF pasa la validación.
	 * En caso contrario lanzara una excepcion de negocio.
	 * @param fileName
	 * @return 
	 */
	def validateTextFileFormat(String fileName){
		int a = fileName.lastIndexOf(".");
		String extName = fileName.substring(a).toUpperCase();
		ArrayList<String> extList = new ArrayList<String>();
		extList.add(".TXT");
		extList.add(".ODT");
		extList.add(".RTF");
		extList.add(".DOC");
		extList.add(".DOCX");
		extList.add(".PDF");
		if(!extList.contains(extName)) {
			throw new BusinessException('El formato de Archivo es inválido. Debe ser un documento de texto válido. Ej: doc, docx, txt, rtf, odt, pdf.')
		}
	}

	/**
	 * Valida que el archivo tenga formato de imagen.
	 * Lo hace validando su extesión y no su contenido.
	 * Si el formato es JPG, JPEG, PNG pasa la validación.
	 * En caso contrario lanzara una excepcion de negocio.
	 * @param fileName
	 * @return
	 */
	def validateImageFileFormat(String fileName){
		int a = fileName.lastIndexOf(".");
		String extName = fileName.substring(a).toUpperCase();
		ArrayList<String> extList = new ArrayList<String>();
		extList.add(".JPG");
		extList.add(".JPEG");
		extList.add(".PNG");
		if(!extList.contains(extName)) {
			throw new BusinessException('El formato de Archivo es inválido. Debe ser una imágen válida Ej: jpg, jpeg, png.')
		}
	}
}
