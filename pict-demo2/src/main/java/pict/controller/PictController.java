package pict.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pict.service.AdminService;
import pict.service.AdminVO;
import pict.service.PictService;
import pict.service.PictVO;

@Controller
public class PictController {

	@Autowired
	PictService pictService;

	@Autowired
	AdminService adminService;


	
	@RequestMapping("/pict_main")
	public String pict_main(@ModelAttribute("pictVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		System.out.println(sessions);
		if (sessions == null || sessions == "null") {
			return "redirect:/pict_login";
		} else {
			String user_id = (String) request.getSession().getAttribute("id");
			if (request.getSession().getAttribute("id") != null) {
				adminVO.setAdminId((String) request.getSession().getAttribute("id"));
				adminVO = adminService.get_user_info(adminVO);
				model.addAttribute("adminVO", adminVO);
			}

			return "redirect:/board/board_list";

		}
	}

	@RequestMapping("/pict_login")
	public String login_main(@ModelAttribute("pictVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpServletResponse response) throws Exception {
		String userAgent = request.getHeader("user-agent");
		String sessions = (String) request.getSession().getAttribute("id");
		boolean mobile1 = userAgent.matches(
				".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*");
		if (mobile1 || mobile2) {
			// 여기 모바일일 경우
			System.out.println("피씨");
			model.addAttribute("message", "PC에서만 사용이 가능합니다.");
			model.addAttribute("retType", ":exit");
			return "pict/main/message";
		}

		if (sessions == null || sessions == "null") {
			return "pict/main/login";
		} else {
			// 나중에 여기 계정별로 리다이렉트 분기처리
			return "redirect:/board/board_list";

		}

	}

	@RequestMapping("/login")
	public String login(@ModelAttribute("adminVO") AdminVO adminVO, HttpServletRequest request, ModelMap model)
			throws Exception {
		// 처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = adminVO.getAdminId();
		String inputPw = adminVO.getAdminPw();

		adminVO = adminService.get_user_info(adminVO);

		if (adminVO != null && adminVO.getId() != null && !adminVO.getId().equals("")) {
			String user_id = adminVO.getId();
			String enpassword = encryptPassword(inputPw, inpuId); // 입력비밀번호

			if (enpassword.equals(adminVO.getPassword())) {
				request.getSession().setAttribute("id", adminVO.getId());
				request.getSession().setAttribute("name", adminVO.getName());
				request.getSession().setAttribute("depart", adminVO.getDepart());

				String ip = request.getRemoteAddr();
				DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String now = format2.format(Calendar.getInstance().getTime());

				adminVO.setLast_login_ip(ip);
				adminVO.setLast_login_date(now);
				adminService.insert_login_info(adminVO);

				adminVO.setAdminId(user_id);
				adminVO = adminService.get_user_info(adminVO);

				return "redirect:/pict_main";

			} else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/pict_login");
				return "pict/main/message";
			}
		} else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/pict_login");
			return "pict/main/message";
		}
	}

	@RequestMapping("/logout")
	public String logout(@ModelAttribute("pictVO") PictVO pictVO, HttpServletRequest request, ModelMap model)
			throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);

		return "redirect:/pict_login";

	}

	// 사용자
	
	@RequestMapping("/")
	public String main(@ModelAttribute("pictVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		return "redirect:/ko/main";
	}
	// 메인
	@RequestMapping("/front/ko/main")
	public String kommain(@ModelAttribute("pictVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		return "redirect:/ko/main";
	}
	@RequestMapping(value = "/ko/main")
	public String main(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		
		pictVO.setType("main");
		List<?> reference_list = pictService.video_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/ko/main";
	}
	@RequestMapping("/front/en/main")
	public String emmain(@ModelAttribute("pictVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		return "redirect:/en/main";
	}
	@RequestMapping(value = "/en/main")
	public String main_en(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		
		pictVO.setType("main_en");
		List<?> reference_list = pictService.video_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/en/main";
	}
	
	// 소개 
	@RequestMapping(value = "/ko/intro")
	public String ko_intro(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		return "pict/ko/intro";
	}
	@RequestMapping(value = "/en/intro")
	public String en_intro(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		return "pict/en/intro";
	}
	// 영상 
	@RequestMapping(value = "/ko/highlight")
	public String highlight(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		pictVO.setType("main");
		List<?> reference_list = pictService.video_list(pictVO);
		
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		return "pict/ko/highlight";
	}
	@RequestMapping(value = "/en/highlight")
	public String highlight_en(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		pictVO.setType("main_en");
		List<?> reference_list = pictService.video_list(pictVO);
		
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);
		return "pict/en/highlight";
	}
	// 공지사항 리스트  
	@RequestMapping(value = "/ko/board_list")
	public String front_board(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("board_list", board_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/ko/board_list";
	}
	@RequestMapping(value = "/en/board_list")
	public String front_board_en(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("board_list", board_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/en/board_list";
	}
	// 뉴스 리스트  
	@RequestMapping(value = "/ko/news_list")
	public String news_list_f(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		List<?> news_list = pictService.news_list(pictVO);
		model.addAttribute("news_list", news_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/ko/news_list";
	}
	@RequestMapping(value = "/en/news_list")
	public String news_list_en(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		List<?> news_list = pictService.news_list(pictVO);
		model.addAttribute("news_list", news_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/en/news_list";
	}
	// 공지사항   
	@RequestMapping(value = "/ko/board_view")
	public String board_view(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		pictVO = pictService.board_list_one(pictVO);
		
		model.addAttribute("pictVO", pictVO);
		return "pict/ko/board_view";
	}
	@RequestMapping(value = "/en/board_view")
	public String board_view_en(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {

		pictVO = pictService.board_list_one(pictVO);
		
		model.addAttribute("pictVO", pictVO);
		return "pict/en/board_view";
	}
	

	// 관리자
	// 공지사항
	@RequestMapping(value = "/board/board_list")
	public String reference_list(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictVO.setUser_id(session);

		List<?> reference_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/board/board_list";
	}

	@RequestMapping(value = "/board/board_register")
	public String reference_register(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.board_list_one(pictVO);
			pictVO.setSaveType("update");

		} else {
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/board/board_register";
	}

	@RequestMapping(value = "/board/board_save", method = RequestMethod.POST)
	public String reference_save(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request,
			@RequestParam("file1root") MultipartFile file1root,
			@RequestParam("file2root") MultipartFile file2root) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		System.out.println("아니");
		

		if(file1root.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, file1root, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/risingstar/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile1(filepath+filename);
		}
		if(file2root.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, file2root, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/risingstar/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setFile2(filepath+filename);
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.board_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list");
			return "pict/main/message";
		} else {
			pictService.board_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list");
			return "pict/main/message";
		}

	}

	@RequestMapping(value = "/board/board_delete")
	public String board_delete(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictService.board_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_list");
		return "pict/main/message";

	}

	
	// 보도자료
	@RequestMapping(value = "/news/news_list")
	public String news_list(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictVO.setUser_id(session);

		List<PictVO> reference_list = pictService.news_list(pictVO);
		
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/news/news_list";
	}

	@RequestMapping(value = "/news/news_register")
	public String news_register(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.news_list_one(pictVO);
			pictVO.setSaveType("update");

		} else {
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/news/news_register";
	}

	@RequestMapping(value = "/news/news_save", method = RequestMethod.POST)
	public String news_save(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		System.out.println("아니");
		


		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.news_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/news/news_list");
			return "pict/main/message";
		} else {
			pictService.news_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/news/news_list");
			return "pict/main/message";
		}

	}

	@RequestMapping(value = "/news/news_delete")
	public String news_delete(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictService.news_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/news/news_list");
		return "pict/main/message";

	}

	
	// 참가영상
	@RequestMapping(value = "/video/video_list")
	public String video_list(PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictVO.setUser_id(session);

		List<PictVO> reference_list = pictService.video_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("size", reference_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/video/video_list";
	}

	@RequestMapping(value = "/video/video_register")
	public String video_register(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.video_list_one(pictVO);
			pictVO.setSaveType("update");

		} else {
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/video/video_register";
	}

	@RequestMapping(value = "/video/video_save", method = RequestMethod.POST)
	public String video_save(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request,
			@RequestParam("file1root") MultipartFile file1root) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		System.out.println("아니");
		

		if(file1root.getSize() != 0) {	//애드벌룬
			String uploadPath = fileUpload(request, file1root, (String)request.getSession().getAttribute("id"));
			String filepath = "/user1/upload_file/risingstar/";
			String filename = uploadPath.split("#####")[1];
			pictVO.setImgurl(filepath+filename);
		}
		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.video_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/video/video_list");
			return "pict/main/message";
		} else {
			pictService.video_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/video/video_list");
			return "pict/main/message";
		}

	}

	@RequestMapping(value = "/video/video_delete")
	public String video_delete(@ModelAttribute("pictVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");

		pictService.video_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/video/video_list");
		return "pict/main/message";

	}

	
	
	
	// 공통메소드
	public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile, String target) {
		String path = "";
		String fileName = "";
		OutputStream out = null;
		PrintWriter printWriter = null;
		long fileSize = uploadFile.getSize();
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();

			path = getSaveLocation(request, uploadFile);

			File file = new File(path);
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
					file = new File(path + fileName);
				}
			}
			out = new FileOutputStream(file);
			out.write(bytes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return path + "#####" + fileName;
	}

	private String getSaveLocation(MultipartHttpServletRequest request, MultipartFile uploadFile) {
		String uploadPath = "/user1/upload_file/risingstar/";
		return uploadPath;
	}

	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null)
			return "";
		if (id == null)
			return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());

		return new String(Base64.encodeBase64(hashValue));
	}

}
