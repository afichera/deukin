package com.deukin

import com.deukin.exceptions.BusinessException


class UploadService {

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
