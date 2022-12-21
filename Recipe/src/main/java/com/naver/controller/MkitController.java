package com.naver.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.service.MkitMemberService;
import com.naver.service.MkitcustomService;
import com.naver.service.MkitmenuService;
import com.naver.service.mkitgongjiService;
import com.naver.vo.MkitcustomVo;
import com.naver.vo.MkitmenuVo;
import com.naver.vo.mkitMemberVo;
import com.naver.vo.mkitgongjiVo;
import com.oreilly.servlet.MultipartRequest;

@Controller
public class MkitController {
	
	@Autowired
	private MkitMemberService mkitmemberService;
	@Autowired
	private mkitgongjiService mkitgongjiService;
	@Autowired
	private MkitcustomService mkitcustomService;
	@Autowired
	private MkitmenuService mkitmenuService;
	
	
	//메인 본문
	@GetMapping("/mkit_main")
	public ModelAndView mkit_main(HttpServletRequest request, @ModelAttribute MkitmenuVo mc) {
		List<MkitmenuVo> mlist=this.mkitmenuService.getbestmenu(mc);
		ModelAndView listM=new ModelAndView();
		listM.addObject("mlist",mlist);
		listM.setViewName("mkit/m_main");
		return listM;
	}
	
	
	//아이디 비번찾기
	@GetMapping("/find_info")
	public ModelAndView find_info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mkit/Login/id_pw_find");
		return mav;
	}	
	
	//아이디찾기
	@RequestMapping("/find_id_ok") //post로 접근하는 url매핑주소 처리
	public ModelAndView find_id_ok(@RequestParam("find_id_name") String mkit_name, @RequestParam("find_id_mail") String mkit_mail,
			HttpServletResponse response, mkitMemberVo m,Model fm) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		m.setMkit_name(mkit_name); 
		m.setMkit_mail(mkit_mail);
		
		mkitMemberVo mmv=mkitmemberService.findId(m);
		
		if(mmv == null) {
			out.println("<script>");
			out.println("alert('회원으로 검색되지 않습니다.\\n 올바른 회원정보를 입력하세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			
			ModelAndView listf=new ModelAndView();
			listf.addObject("mmv",mmv);
			
			listf.setViewName("mkit/Login/check_info");//뷰페이지 폴더
			//경로와 파일명 지정
			return listf;
		}
		
		return null;
	}
	
	
	//비번찾기
	@RequestMapping("/find_pw_ok") //post로 접근하는 url매핑주소 처리
	public ModelAndView find_pw_ok(@RequestParam("find_pw_id") String mkit_id, @RequestParam("find_pw_mail") String mkit_mail,
			HttpServletResponse response, mkitMemberVo m,Model fm) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		m.setMkit_id(mkit_id); 
		m.setMkit_mail(mkit_mail);
		
		mkitMemberVo mmv=mkitmemberService.findPwd(m);
		
		if(mmv == null) {
			out.println("<script>");
			out.println("alert('회원으로 검색되지 않습니다.\\n 올바른 회원정보를 입력하세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			
			ModelAndView listf=new ModelAndView();
			listf.addObject("mmv",mmv);
			
			listf.setViewName("mkit/Login/check_pwd");//뷰페이지 폴더
			//경로와 파일명 지정
			return listf;
		}
		
		return null;
	}
	
	
	//마이페이지	
	@RequestMapping(value = "/mkit_mypage", method = RequestMethod.GET)
	public String infoGET(HttpSession session, Model model, @ModelAttribute mkitMemberVo g, HttpServletResponse response
			) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//세션 객체 안에 있는 ID정보 저장
		String id = (String) session.getAttribute("id");

		//서비스안의 회원정보보기 메서드 호출
		g = mkitmemberService.readMember(id);
		
		//정보저장 후 페이지 이동
		model.addAttribute("meminfo", g);
	
		
		return "mkit/Login/mypage";
	}
	//회원 탈퇴
	@RequestMapping("/member_del")
	public String delmem(HttpSession session, Model model, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");

		String id = (String) session.getAttribute("id");
		
		PrintWriter out = response.getWriter();
		
		String passcheck=request.getParameter("del_pa_check");
		String cuspass=mkitmemberService.findpass(id);
		out.println(passcheck);
		out.println(cuspass);
		
		
		if(passcheck.equals(cuspass)) {
			mkitmemberService.deluser(id);
			out.println("<script>");
			out.println("alert('삭제되었습니다.');");
			out.println("location.href='/mkit_main'");
			out.println("</script>");
			session.invalidate();
		}else {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}
		return null;
	}
	//수정
	@RequestMapping(value = "/mkit_edit", method = RequestMethod.GET)
	public String editUser(HttpSession session, Model model, @ModelAttribute mkitMemberVo g) throws Exception{

		//세션 객체 안에 있는 ID정보 저장
		String id = (String) session.getAttribute("id");

		//서비스안의 회원정보보기 메서드 호출
		g = mkitmemberService.readMember(id);
		
		String phone=g.getMkit_phone();
		String secphone = phone.substring(0, 4);
		String lastphone = phone.substring(5);
		
		//정보저장 후 페이지 이동
		model.addAttribute("meminfo", g);
		model.addAttribute("secphone", secphone);
		model.addAttribute("lastphone", lastphone);
		
		return "mkit/Login/changeinfo";
	}
	
	@RequestMapping("/mkit_edit_ok")
	public String user_edit_ok(@ModelAttribute mkitMemberVo mmvo, HttpServletResponse response, HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//웹브라우저로 출력되는 파일형태와 언어코딩 타입을 설정
		PrintWriter out=response.getWriter();
		
		String e_name=request.getParameter("edit_name");
		String e_id=request.getParameter("edit_id");
		String e_pwd=request.getParameter("edit_pwd");
		String e_mail= request.getParameter("edit_mail");
		String secphone= request.getParameter("edit_secphone");
		String lastphone= request.getParameter("edit_lastphone");
		
		String phone=secphone+"-"+lastphone;
		
		mmvo.setMkit_name(e_name);
		mmvo.setMkit_id(e_id);
		mmvo.setMkit_password(e_pwd);
		mmvo.setMkit_mail(e_mail);
		mmvo.setMkit_phone(phone);
		
		this.mkitmemberService.edituser(mmvo);
		return "redirect:/mkit_mypage";
	}
	
	
	
	//회원가입
	@GetMapping("/mkit_join")
	public ModelAndView join(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mkit/Login/join");
		return mav;
	}
	
	@RequestMapping(value="/mkitjoin", method=RequestMethod.POST)
	public String mkitjoin(mkitMemberVo mkitvo, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		PrintWriter out = response.getWriter();
		
		String m_name=request.getParameter("m_name");
		String m_id=request.getParameter("m_id");
		String m_pwd=request.getParameter("m_pwd");
		String m_mail= request.getParameter("m_mail");
		String secphone= request.getParameter("secphone");
		String lastphone= request.getParameter("lastphone");
		
		String phone=secphone+"-"+lastphone;
		
		mkitvo.setMkit_name(m_name);
		mkitvo.setMkit_id(m_id);
		mkitvo.setMkit_password(m_pwd);
		mkitvo.setMkit_mail(m_mail);
		mkitvo.setMkit_phone(phone);
		
		mkitmemberService.insertmkitmem(mkitvo);
		
		return "redirect:/mkit_main";
	}
	
	@PostMapping("/member_idcheck")
	public String member_idcheck(String id,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		mkitMemberVo db_id=this.mkitmemberService.idCheck(id);//아이디에 해당 회원정보를 DB로 부터 검색
		int re=-1;//중복 아이디가 없을때 반환값

		if(db_id != null) {//중복 아이디가 있는 경우
			re=1;
		}
		out.println(re);//값 반환
		return null;
	}//member_idcheck()
	
	
	//로그인
	@GetMapping("/mkit_Login")
	public ModelAndView Login(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("mkit/Login/Login");
		return mav;
	}
	
	@RequestMapping("/member_login_ok")
	public ModelAndView member_login_ok(String login_id,String login_password,HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		mkitMemberVo m= mkitmemberService.loginCheck(login_id);//로그인 인증처리

		if(m == null) {
			out.println("<script>");
			out.println("alert('가입 안된 회원입니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(!m.getMkit_password().equals(login_password)) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.go(-1);");
				out.println("</script>");
			}else{
				int grante=mkitmemberService.grantcheck(login_id);
				session.setAttribute("login", "loginok");
				session.setAttribute("id",login_id);//세션 id키이름에 아이디 저장
				session.setAttribute("grante", grante);
				return new ModelAndView("redirect:/mkit_main");//로그인 인증 후 메인화면으로 이동
			}//if else
		}
		return null;
	}//member_login_ok()


	//로그아웃
	@RequestMapping("/mkit_Logout")
	public String member_logout(HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		session.invalidate();//세션 만료 => 로그아웃

		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='/mkit_main';");
		out.println("</script>");

		return null;
	}//member_logout()
	
	
	
	private boolean isLogin(HttpSession session, HttpServletResponse response) throws Exception {
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");

		if(id == null) {
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='mkit_Login';");
			out.println("</script>");

			return false;
		}
		return true;
	}

	
	
	
	
	
	
	
	
	//공지사항 게시판
	//공지사항으로 이동
	@GetMapping("/gongji_list")
	public ModelAndView GongjiList(@ModelAttribute mkitgongjiVo m, HttpServletRequest request) {
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		//필드
		m.setFind_field(find_field);
		m.setFind_name("%"+find_name+"%");
		//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
		//매핑 대응

		int listcount=this.mkitgongjiService.getListCount(m);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		//System.out.println("총 게시물수:"+listcount+"개");

		m.setStartrow((page-1)*10+1);//시작행번호
		m.setEndrow(m.getStartrow()+limit-1);//끝행번호

		List<mkitgongjiVo> glist=this.mkitgongjiService.getBoardList(m);
		//목록

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		ModelAndView listM=new ModelAndView();
		listM.addObject("glist",glist);//blist 키이름에 값 저장
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
		listM.addObject("listcount",listcount);	
		listM.addObject("find_field",find_field);
		listM.addObject("find_name", find_name);

		listM.setViewName("mkit/gongji/gongji_list");//뷰페이지 폴더
		//경로와 파일명 지정
		return listM;
	}
	//공지 작성
	@RequestMapping(value="/gongji_write" ,method=RequestMethod.GET)
	public String board_write(HttpServletRequest request, Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		m.addAttribute("page",page);
		return "mkit/gongji/gongji_write";
	}//board_write()
	
	//공지 저장
	@RequestMapping(value="/gongji_write_ok", method=RequestMethod.POST)
	//POST방식으로 접근하는 매핑주소를 처리
	public ModelAndView board_write_ok(@ModelAttribute mkitgongjiVo g) {
		this.mkitgongjiService.insertgongji(g);//게시판 저장
		return new ModelAndView("redirect:/gongji_list");
	}//board_write_ok()
	
	//내용보기+삭제+수정이동
	@RequestMapping("/gongji_cont")
	public String board_cont(@RequestParam("no") int gongji_no, @RequestParam("state") String state, HttpServletRequest request,
			Model m,@ModelAttribute mkitgongjiVo g) throws Exception{
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}

		if(state.equals("cont")) {//내용보기일때만 조회수 증가
			this.mkitgongjiService.updateHit(gongji_no);
		}
		g=this.mkitgongjiService.getGongjiCont(gongji_no);
		String gongji_cont=g.getGongji_cont().replace("\n", "<br/>");
		//textarea태그 영역에서 엔터키 친부분을 웹브라우에 출력할때 줄바꿈처리

		m.addAttribute("g",g);
		m.addAttribute("gcont",gongji_cont);
		m.addAttribute("page",page);//키,값 쌍으로 저장

		if(state.equals("cont")) {//내용보기
			return "mkit/gongji/gongji_cont";// /WEB-INF/board/
		}else if(state.equals("edit")) {//수정폼
			return "mkit/gongji/gongji_edit";
		}else if(state.equals("del")) {//삭제폼
			mkitgongjiService.delgongji(gongji_no);//게시판 삭제
			return "redirect:/gongji_list?page="+page;
		}
		return null;
	}//board_cont()
	
	
	//수정
	@PostMapping("/gongji_edit_ok")
	public String board_edit_ok(@ModelAttribute mkitgongjiVo mk, HttpServletResponse response, HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//웹브라우저로 출력되는 파일형태와 언어코딩 타입을 설정
		PrintWriter out=response.getWriter();

		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		this.mkitgongjiService.editgongji(mk);//게시물 수정
		return "redirect:/gongji_cont?no="+mk.getGongji_no()+"&page="+page+"&state=cont";
	}
		
	
	
	
	//사용자 게시물 보기
	@GetMapping("/custom_list")
	public ModelAndView GongjiList(MkitcustomVo m, HttpServletRequest request) {
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=request.getParameter("find_name");//검색어
		String find_field=request.getParameter("find_field");//검색
		//필드
		m.setFind_field(find_field);
		m.setFind_name("%"+find_name+"%");
		//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
		//매핑 대응

		int listcount=this.mkitcustomService.getcustomCount(m);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		System.out.println("총 게시물수:"+listcount+"개");

		m.setStartrow((page-1)*10+1);//시작행번호
		m.setEndrow(m.getStartrow()+limit-1);//끝행번호

		List<MkitcustomVo> clist=this.mkitcustomService.getCustomList(m);
		//목록
		System.out.println("목록개수: "+clist.size()+"개");

		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;

		ModelAndView listM=new ModelAndView();
		listM.addObject("clist",clist);//clist 키이름에 값 저장
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
		listM.addObject("listcount",listcount);	
		listM.addObject("find_field",find_field);
		listM.addObject("find_name", find_name);

		listM.setViewName("mkit/custom/custom_list");//뷰페이지 폴더
		//경로와 파일명 지정
		return listM;
	}
	//사용자 게시물 작성
	@RequestMapping(value="/custom_write" ,method=RequestMethod.GET)
	public String custom_write(HttpServletRequest request, Model m) {
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		m.addAttribute("page",page);
		return "mkit/custom/custom_write";
	}//board_write()
	
	
	//사용자 게시물 저장
	@RequestMapping(value="/custom_write_ok", method=RequestMethod.POST)
	//POST방식으로 접근하는 매핑주소를 처리
	public ModelAndView custom_write_ok(@ModelAttribute MkitcustomVo mc) {
		this.mkitcustomService.insertcustom(mc);//게시판 저장
		return new ModelAndView("redirect:/custom_list");
	}//board_write_ok()
	
	//내용보기+삭제+수정이동
		@RequestMapping("/custom_cont")
		public String board_cont(@RequestParam("no") int custom_no, @RequestParam("state") String state, HttpServletRequest request,
				Model m,@ModelAttribute MkitcustomVo c) throws Exception{
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}

			if(state.equals("cont")) {//내용보기일때만 조회수 증가
				this.mkitcustomService.updateHit(custom_no);
			}
			c=this.mkitcustomService.getCustomCont(custom_no);
			String custom_cont=c.getCustom_cont().replace("\n", "<br/>");
			//textarea태그 영역에서 엔터키 친부분을 웹브라우에 출력할때 줄바꿈처리

			m.addAttribute("c",c);
			m.addAttribute("ccont",custom_cont);
			m.addAttribute("page",page);//키,값 쌍으로 저장

			if(state.equals("cont")) {//내용보기
				return "mkit/custom/custom_cont";// /WEB-INF/board/
			}else if(state.equals("edit")) {//수정폼
				return "mkit/custom/custom_edit";
			}else if(state.equals("del")) {//삭제폼
				mkitcustomService.delcustom(custom_no);//게시판 삭제
				return "redirect:/custom_list?page="+page;
			}
			return null;
		}//custom_cont()
	
		
		//수정
		@PostMapping("/custom_edit_ok")
		public String custom_edit_ok(@ModelAttribute MkitcustomVo m, HttpServletResponse response, HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			//웹브라우저로 출력되는 파일형태와 언어코딩 타입을 설정
			PrintWriter out=response.getWriter();

			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			this.mkitcustomService.editcustom(m);//게시물 수정
			return "redirect:/custom_cont?no="+m.getCustom_no()+"&page="+page+"&state=cont";
		}
		
		
		
		
		
		
		//메뉴페이지
		@RequestMapping("/mkit_menu")
		public ModelAndView mkit_menu(@ModelAttribute MkitmenuVo mc, HttpServletRequest request) {	
			
			int page=1;//쪽번호
			int limit=12;//한페이지에 보여지는 목록개수
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			mc.setFind_field(find_field);
			mc.setFind_name("%"+find_name+"%");
			//%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
			//매핑 대응

			int listcount=this.mkitmenuService.getmenuCount(mc);

			mc.setStartrow((page-1)*12+1);//시작행번호
			mc.setEndrow(mc.getStartrow()+limit-1);//끝행번호

			List<MkitmenuVo> mlist=this.mkitmenuService.getmenuList(mc);

			//총페이지수
			int maxpage=(int)((double)listcount/limit+0.95);
			//현재 페이지에 보여질 시작페이지 수(1,11,21)
			int startpage=(((int)((double)page/10+0.9))-1)*10+1;
			//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
			int endpage=maxpage;
			if(endpage > startpage+10-1) endpage=startpage+10-1;

			ModelAndView listM=new ModelAndView();
			listM.addObject("mlist",mlist);
			listM.addObject("page",page);
			listM.addObject("startpage",startpage);
			listM.addObject("endpage",endpage);
			listM.addObject("maxpage",maxpage);
			listM.addObject("listcount",listcount);	
			listM.addObject("find_field",find_field);
			listM.addObject("find_name", find_name);

			listM.setViewName("mkit/item/menupage");//뷰페이지 폴더
			//경로와 파일명 지정
			return listM;
		}
		
		//메뉴 등록 페이지
		@RequestMapping("/menu_insert")
		public ModelAndView menu_insert(@ModelAttribute MkitcustomVo mc, HttpServletRequest request,Model m) {	
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			m.addAttribute("page",page);
			ModelAndView mav = new ModelAndView("mkit/item/menuinsert");
			return mav;
		}
		//메뉴 저장
		@RequestMapping("/menu_write_ok")
		public void menu_write_ok(@ModelAttribute MkitmenuVo mm, HttpServletResponse response, 
				HttpServletRequest request) throws Exception {
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			String saveFolder=request.getRealPath("/resources/upload");//이진 파일 업로드 서버 경로=>톰켓 WAS서버에 의해서 변경된 실제 경로:
			//C:\20220607\Spring_Work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\project\resources\
			//upload
			
			int fileSize=5*1024*1024; //이진파일 업로드 최대크기
			MultipartRequest multi=null; //이진파일을 가져올 참조변수
			
			multi=new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			
			String item_name=multi.getParameter("item_name");
			int item_price=Integer.parseInt(multi.getParameter("item_price"));
			String item_cont=multi.getParameter("item_cont");

			File upFile = multi.getFile("item_file");//첨부한 이진파일을 가져온다.
			
			if(upFile != null) {//첨부한 이진파일이 있는 경우 실행
				String fileName=upFile.getName();//첨부한 파일명
				Calendar cal=Calendar.getInstance();//칼렌더는 추상클래스로 new로 객체 생성을 못함. 년월일 시분초 값을 반환
				int year=cal.get(Calendar.YEAR);//년도값
				int month=cal.get(Calendar.MONTH)+1;//월값, +1을 한 이유는 1월이 0으로 반환 되기 때문에
				int date=cal.get(Calendar.DATE);//일값
				
				String homedir=saveFolder+"/"+year+"-"+month+"-"+date;//오늘 날짜 폴더 경로 저장
				File path01=new File(homedir);
				
				if(!(path01.exists())){
					path01.mkdir();//오늘날짜 폴더 생성
				}
				Random r=new Random();//난수를 발생시키는 클래스
				int random=r.nextInt(100000000);//0이상 1억 미만의 정수 숫자 난수 발생
				
				/*첨부 파일 확장자를 구함*/
				int index=fileName.lastIndexOf(".");//마침표를 맨 오른쪽부터 찾아서 가장 먼저 나오는 .의 위치번호를 맨 왼쪽부터 카운터 해서 반환
				//첫문자는 0부터 시작
				String fileExtendsion=fileName.substring(index+1);//마침표 이후부터 마지막 문자까지 구함.즉 첨부파일 확장자를 구함.
				String refileName="mkitmenu"+year+month+date+random+"."+fileExtendsion;//새로운 파일명 저장
				String fileDBName="/"+year+"-"+month+"-"+date+"/"+refileName;//데이터베이스에 저장될 레코드값
				upFile.renameTo(new File(homedir+"/"+refileName));//생성된 폴더에 변경된 파일명으로 실제 업로드
				
				mm.setMk_images(fileDBName);
			}else {//첨부파일이 없는 경우
				String fileDBName="";
				mm.setMk_images(fileDBName);
			}
			mm.setMk_name(item_name); 
			mm.setMk_price(item_price);  
			mm.setMk_info(item_cont);
			
			this.mkitmenuService.insertmenu(mm);//게시판 저장
			
			out.println("<script>");
			out.println("alert('등록되었습니다.');");
			out.println("location='/mkit_menu';");
			out.println("</script>");
			
		}

		@RequestMapping("/menu_cont")
		public String menu_cont(@RequestParam("no") int mk_id, @RequestParam("state") String state, HttpServletRequest request,
				Model m,@ModelAttribute MkitmenuVo mm) throws Exception{
			int page=1;
			if(request.getParameter("page") != null) {
				page=Integer.parseInt(request.getParameter("page"));			
			}
			mm=this.mkitmenuService.getmenuCont(mk_id);
			String menu_cont=mm.getMk_info().replace("\n", "<br/>");
			//textarea태그 영역에서 엔터키 친부분을 웹브라우에 출력할때 줄바꿈처리

			m.addAttribute("mm",mm);
			m.addAttribute("mcont",menu_cont);
			m.addAttribute("page",page);//키,값 쌍으로 저장

			if(state.equals("cont")) {//내용보기
				return "mkit/flex/menu_cont";// /WEB-INF/board/
			}else if(state.equals("edit")) {//수정폼
				return "mkit/custom/custom_edit";
			}else if(state.equals("del")) {//삭제폼
				mkitcustomService.delcustom(mk_id);//게시판 삭제
				return "redirect:/mkit_menu?page="+page;
			}
			return null;
		}//custom_cont()
		
		
		
		
		
		//장바구니
		@RequestMapping("/menu_backpack")
		public ModelAndView menu_backpack(@ModelAttribute MkitcustomVo mc, HttpServletRequest request,Model m) {	
			ModelAndView mav = new ModelAndView("mkit/flex/backpack");
			return mav;
		}
		
		//구매페이지
		@RequestMapping("/menu_buy")
		public ModelAndView menu_buy(@ModelAttribute mkitMemberVo mm,HttpSession session,@RequestParam String iitem_name, 
				String total, HttpServletRequest request,Model m) {	
			String id = (String) session.getAttribute("id");
			mm= mkitmemberService.readMember(id);
			
			ModelAndView listG=new ModelAndView();
			listG.addObject("mm",mm);
			listG.addObject("iitem_name",iitem_name);
			listG.addObject("total",total);
			
			listG.setViewName("mkit/flex/buy_test");
			return listG;
		}
}
