package kr.or.ddit.library.dao;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.LibraryVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class LibraryDAOImpl implements ILibraryDAO {
	
	private static ILibraryDAO dao = new LibraryDAOImpl();
	private SqlMapClient smc;

	private LibraryDAOImpl(){
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ILibraryDAO getInstance(){
		return (dao == null) ? dao = new LibraryDAOImpl() : dao;
	}

	@Override
	public List<LibraryVO> libraryList(Map<String, String> params)
			throws Exception {
		return smc.queryForList("library.libraryList", params);
	}

	@Override
	public String insertLibrary(LibraryVO libraryInfo)
			throws Exception {
		return (String) smc.insert("library.insertLibrary", libraryInfo);
	}

	@Override
	public LibraryVO libraryInfo(Map<String, String> params) throws Exception {
		return (LibraryVO) smc.queryForObject("library.libraryInfo", params);
	}

	@Override
	public void deleteLibraryboard(Map<String, String> params) throws Exception {
		smc.update("library.deleteLibraryboard", params);
	}

	@Override
	public void updateLibrary(LibraryVO libraryInfo) throws Exception {
		smc.update("library.updateLibrary", libraryInfo);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) smc.queryForObject("library.totalCount", params);

	}

	@Override
	public String insertLibraryReply(LibraryVO libraryInfo) throws Exception {
		 String bo_no = "";
	      try{
	         smc.startTransaction();
	         String bo_seq;
	         if("0".intern() == libraryInfo.getLibrary_seq().intern()){
	            bo_seq = (String) smc.queryForObject("library.incrementSeq", libraryInfo);
	         }else{
	        	smc.update("library.updateSeq", libraryInfo);
	            bo_seq = String.valueOf(Integer.parseInt(libraryInfo.getLibrary_seq()) + 1);
	         }
	         libraryInfo.setLibrary_seq(bo_seq);
	         
	         String bo_depth = String.valueOf(Integer.parseInt(libraryInfo.getLibrary_depth()) + 1);
	         libraryInfo.setLibrary_depth(bo_depth);

	         bo_no = (String) smc.insert("library.insertLibraryReply", libraryInfo);
	         
	         smc.commitTransaction();
	      }finally{
	    	  smc.endTransaction();
	      }
	      return bo_no;
	}

	@Override
	public int libraryCount() throws Exception {
		return (int) smc.queryForObject("library.libraryCount");
	}

	@Override
	public void modifylibrary(Map<String, String> params) throws Exception {
		smc.update("library.addFile",params);
	}

	
}
