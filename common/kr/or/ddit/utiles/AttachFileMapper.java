package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.LibraryFileVO;
import kr.or.ddit.vo.QnAFileVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.ThumbnailFileVO;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;

public class AttachFileMapper {
   public static List<FreeFileVO> mapper(FileItem[] items,
                                 String bo_no){
      List<FreeFileVO> fileItemList = new ArrayList<>();
      
      if(items != null){
         FreeFileVO fileItemInfo = null;
         for(FileItem item : items){
            fileItemInfo = new FreeFileVO();
            fileItemInfo.setFreefile_bo_no(bo_no);
            // 파일명 취득
            // 브라우저별   d:\\temp\image\a.png
            //        or a. png
            String fileName = FilenameUtils.getName(item.getName());
            fileItemInfo.setFreefile_name(fileName);
            
            // 파일 실제 저장소 : d:\\temp\\files
            // 저장용 파일명을 별도로 작성
            // a.png => a
            String baseName = FilenameUtils.getBaseName(fileName);
            // a.png => png
            String extension = FilenameUtils.getExtension(fileName);
            //   |--------------------| -> 유니크한 랜덤값
            // a124314124125125215125.png
            //UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
            String genID = UUID.randomUUID().toString().replace("-", "");
            String saveFileName = baseName+genID+"."+extension;
            fileItemInfo.setFreefile_save_name(saveFileName);
            fileItemInfo.setFreefile_content_type(item.getContentType());
            fileItemInfo.setFreefile_size(String.valueOf(item.getSize()));
            
            fileItemList.add(fileItemInfo);
            
            saveFile(saveFileName, item);
         }
      }
      return fileItemList;
   }
   public static List<ThumbnailFileVO> thumbnailmapper(FileItem[] items,
         String bo_no){
      List<ThumbnailFileVO> fileItemList = new ArrayList<>();
      
      if(items != null){
         ThumbnailFileVO fileItemInfo = null;
         for(FileItem item : items){
            fileItemInfo = new ThumbnailFileVO();
            fileItemInfo.setThumbfile_thumbnail_no(bo_no);
            // 파일명 취득
            // 브라우저별   d:\\temp\image\a.png
            //        or a. png
            String fileName = FilenameUtils.getName(item.getName());
            fileItemInfo.setThumbfile_name(fileName);
            
            // 파일 실제 저장소 : d:\\temp\\files
            // 저장용 파일명을 별도로 작성
            // a.png => a
            String baseName = FilenameUtils.getBaseName(fileName);
            // a.png => png
            String extension = FilenameUtils.getExtension(fileName);
            //   |--------------------| -> 유니크한 랜덤값
            // a124314124125125215125.png
            //UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
            String genID = UUID.randomUUID().toString().replace("-", "");
            String saveFileName = baseName+genID+"."+extension;
            fileItemInfo.setThumbfile_save_name(saveFileName);
            fileItemInfo.setThumbfile_content_type(item.getContentType());
            fileItemInfo.setThumbfile_size(String.valueOf(item.getSize()));
            
            fileItemList.add(fileItemInfo);
            
            saveFile(saveFileName, item);
         }
      }
      return fileItemList;
   }
   
   public static List<NoticeFileVO> noticemapper(FileItem[] items,
         String notice_no){
      List<NoticeFileVO> fileItemList = new ArrayList<>();
      
      if(items != null){
         NoticeFileVO fileItemInfo = null;
         for(FileItem item : items){
            fileItemInfo = new NoticeFileVO();
            fileItemInfo.setNoticefile_notice_no(notice_no);
            // 파일명 취득
            // 브라우저별   d:\\temp\image\a.png
            //        or a. png
            String fileName = FilenameUtils.getName(item.getName());
            fileItemInfo.setNoticefile_name(fileName);
            
            // 파일 실제 저장소 : d:\\temp\\files
            // 저장용 파일명을 별도로 작성
            // a.png => a
            String baseName = FilenameUtils.getBaseName(fileName);
            // a.png => png
            String extension = FilenameUtils.getExtension(fileName);
            //   |--------------------| -> 유니크한 랜덤값
            // a124314124125125215125.png
            //UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
            String genID = UUID.randomUUID().toString().replace("-", "");
            String saveFileName = baseName+genID+"."+extension;
            fileItemInfo.setNoticefile_save_name(saveFileName);
            fileItemInfo.setNoticefile_content_type(item.getContentType());
            fileItemInfo.setNoticefile_size(String.valueOf(item.getSize()));
            
            fileItemList.add(fileItemInfo);
            
            saveFile(saveFileName, item);
         }
      }
      return fileItemList;
   }
   public static List<LibraryFileVO> librarymapper(FileItem[] items,
         String bo_no){
      List<LibraryFileVO> fileItemList = new ArrayList<>();
      
      if(items != null){
         LibraryFileVO fileItemInfo = null;
         for(FileItem item : items){
            fileItemInfo = new LibraryFileVO();
            fileItemInfo.setLibraryfile_library_no(bo_no);
            // 파일명 취득
            // 브라우저별   d:\\temp\image\a.png
            //        or a. png
            String fileName = FilenameUtils.getName(item.getName());
            fileItemInfo.setLibraryfile_name(fileName);
            
            // 파일 실제 저장소 : d:\\temp\\files
            // 저장용 파일명을 별도로 작성
            // a.png => a
            String baseName = FilenameUtils.getBaseName(fileName);
            // a.png => png
            String extension = FilenameUtils.getExtension(fileName);
            //   |--------------------| -> 유니크한 랜덤값
            // a124314124125125215125.png
            //UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
            String genID = UUID.randomUUID().toString().replace("-", "");
            String saveFileName = baseName+genID+"."+extension;
            fileItemInfo.setLibraryfile_save_name(saveFileName);
            fileItemInfo.setLibraryfile_content_type(item.getContentType());
            fileItemInfo.setLibraryfile_size(String.valueOf(item.getSize()));
            
            fileItemList.add(fileItemInfo);
            
            saveFile(saveFileName, item);
         }
      }
      return fileItemList;
   }
   public static List<QnAFileVO> qnaMapper(FileItem[] items,
         String qna_no){
      List<QnAFileVO> fileItemList = new ArrayList<>();
      
      if(items != null){
         QnAFileVO fileItemInfo = null;
         for(FileItem item : items){
            fileItemInfo = new QnAFileVO();
            fileItemInfo.setQnafile_qna_no(qna_no);
            // 파일명 취득
            // 브라우저별   d:\\temp\image\a.png
            //        or a. png
            String fileName = FilenameUtils.getName(item.getName());
            fileItemInfo.setQnafile_name(fileName);
            
            // 파일 실제 저장소 : d:\\temp\\files
            // 저장용 파일명을 별도로 작성
            // a.png => a
            String baseName = FilenameUtils.getBaseName(fileName);
            // a.png => png
            String extension = FilenameUtils.getExtension(fileName);
            //   |--------------------| -> 유니크한 랜덤값
            // a124314124125125215125.png
            //UUID(Univerally Unique Identifier) : 128bit 유일값 생성(-포함)
            String genID = UUID.randomUUID().toString().replace("-", "");
            String saveFileName = baseName+genID+"."+extension;
   
            fileItemInfo.setQnafile_save_name(saveFileName);
            fileItemInfo.setQnafile_content_type(item.getContentType());
            fileItemInfo.setQnafile_size(String.valueOf(item.getSize()));
            fileItemList.add(fileItemInfo);
            
            saveFile(saveFileName, item);
         }
      }
      return fileItemList;
   }

   private static void saveFile(String saveFileName, FileItem item) {
      File saveFile = new File(GlobalConstant.FILE_PATH,saveFileName);
      try {
         item.write(saveFile);
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
}