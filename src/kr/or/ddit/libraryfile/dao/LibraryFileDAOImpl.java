package kr.or.ddit.libraryfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FreeFileVO;
import kr.or.ddit.vo.LibraryFileVO;

import com.ibatis.sqlmap.client.SqlMapClient;

public class LibraryFileDAOImpl implements ILibraryFileDAO {

	private static ILibraryFileDAO dao = new LibraryFileDAOImpl();
	private SqlMapClient smc;
	
	private LibraryFileDAOImpl() {
		smc = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static ILibraryFileDAO getInstance(){
		return (dao == null) ? new LibraryFileDAOImpl() : dao;
	}

	@Override
	public void insertLibraryfile(List<LibraryFileVO> libraryFileList)
			throws Exception {
		try{
			smc.startTransaction();
			
			for(LibraryFileVO libraryfileInfo : libraryFileList){
				smc.insert("libraryfile.insertLibraryfile", libraryfileInfo);
			}
			smc.commitTransaction();
		}finally{
			smc.endTransaction();
		}
		
		
	}

	@Override
	public LibraryFileVO libraryFileInfo(Map<String, String> params)
			throws Exception {
		return (LibraryFileVO) smc.queryForObject("libraryfile.libraryFileInfo", params);

	}

	@Override
	public List<LibraryFileVO> libraryFileList(int libraryfile_library_no)
			throws Exception {
		return smc.queryForList("libraryfile.fileList", libraryfile_library_no);
	}
	
	
}
