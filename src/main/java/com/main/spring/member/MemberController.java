package com.main.spring.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	private ModelAndView mav = new ModelAndView();
	@RequestMapping(value = "/member/join.mem", method = RequestMethod.GET)
	public ModelAndView join() {
		return mav;
	}
	@RequestMapping(value = "/member/idCheck.mem", method = RequestMethod.GET)
	public void idCheck(String id,
								HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String out = "";
		if(id=="") {
			out="<span></span><input type='text' id ='idc' name='idc' value='1'>";
		}else if(id.length()<4 || id.length()>12) {
			out = "<span style='color:red;'><i class='fa fa-remove'></i>최소 4자리 최대 12자리로 정해 주세요.</span><input type ='text' id='idc' value='1'>";
		}else if(id.contains("admin")) {
			out="<span style='color:red;'><i class='fa fa-remove'></i>admin이 포함될수 없습니다.</span><input type ='text' id='idc' value='1'>";
		}else {
			if(memberService.idCheck(id)==1) {
				out="<span style='color:red;'><i class='fa fa-remove'></i>이미 존재하는 아이디 입니다 .</span><input type ='text' id='idc' value='1'>";
			}else {
				out="<span style='color:blue;'><i class='fa fa-check'></i></span><input type ='text' id='idc' value='0'>";
			}
		}
		response.getWriter().print(out);

	}
	@RequestMapping(value = "/member/addMember.mem", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute MemberVO memberVO,
									HttpServletRequest request,
									HttpServletResponse response) {
		memberService.addMember(memberVO);
		mav.setViewName("redirect:/index.pro"); 
		request.getSession().setAttribute("id",memberVO.getId());
		return mav;
	}
	@RequestMapping(value = "/member/login.mem" , method = RequestMethod.GET)
	public ModelAndView login() {
		mav.clear();
		return mav;
	}
	@RequestMapping(value = "/member/loginCheck.mem" , method = RequestMethod.POST)
	public ModelAndView loginMember(@ModelAttribute MemberVO memberVO,
									HttpServletRequest request,
									HttpServletResponse response){
		String msg = memberService.loginMember(memberVO);

		if(msg.equals("login")) {
			request.getSession().setAttribute("id",memberVO.getId());
			mav.setViewName("redirect:/index.pro");
		}else {
			mav.addObject("msg",msg);
			mav.setViewName("member/login");
		}
		return mav;
	}
	@RequestMapping(value = "/member/logout.mem", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,
							   HttpServletResponse response) {
		String inforpage = request.getHeader("referer").substring(29);
		String nextPage = inforpage.substring(0,inforpage.indexOf("."));
		request.getSession().invalidate();
		mav.setViewName(nextPage);
		return mav;
	}
	@RequestMapping(value = "/member/memMod.mem", method = RequestMethod.GET)
	public ModelAndView memMod(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		mav.addObject("meminfo", memberService.memMod(id));
		mav.setViewName("member/memMod");
		return mav;
	}
	@RequestMapping(value = "/member/updateMem.mem", method = RequestMethod.POST)
	public ModelAndView updateMem(@ModelAttribute MemberVO memberVO,
								  HttpServletRequest request) {
		memberService.updateMem(memberVO);
		mav.setViewName("redirect:/index.pro");
		return mav;
	}
	@RequestMapping(value = "/member/findId.mem" , method = RequestMethod.GET)
	public ModelAndView findId() {
		mav.clear();
		return mav;
	}
	@RequestMapping(value = "/member/findIdCheck.mem" , method = RequestMethod.POST)
	public ModelAndView findIdCheck(@ModelAttribute MemberVO memberVO) {
		memberVO = memberService.findId(memberVO);
		String msg="";
		if(memberVO.getId().equals("admin")){
			msg = "잘못됫 정보 입니다.";
			mav.addObject("msg",msg);
			mav.setViewName("findId");
		}else {
			String idMaking = memberVO.getId();
			String id = idMaking.substring(0,idMaking.length()-2)+"**";
			memberVO.setId(id);
			mav.addObject("meminfo",memberVO);
			mav.setViewName("member/findpwd");
		}
		return mav;
	}
	@RequestMapping(value = "/member/findpwdCheck.mem" , method = RequestMethod.POST)
	public ModelAndView finpwdCheck(@ModelAttribute MemberVO memberVO)throws Exception{
		if(memberService.idCheck(memberVO.getId())==0) {
			mav.addObject("msg2","잘못된 아이디 입니다 . ");
			mav.addObject("meminfo",memberVO);
			mav.setViewName("findpwd");
		}else {
			memberVO=memberService.memMod(memberVO.getId());
			memberService.SendEmail(memberVO);
			mav.addObject("msg","메일 전송이 완료 되었습니다 .");
			mav.setViewName("member/login");
		}
		return mav;
	}
	
	@RequestMapping(value = "/member/mypage.mem" , method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		
		if(request.getParameter("addpoint")!=null) {
			HashMap map = new HashMap();
			map.put("id",id);
			map.put("addpoint",request.getParameter("addpoint"));
			memberService.addpoint(map);
		}
		
		MemberVO memberVO = memberService.memMod(id);
		mav.addObject("meminfo",memberVO);
		mav.setViewName("member/mypage");
		return mav;
	}
	@RequestMapping(value = "/member/updateaddr.mem", method = RequestMethod.POST)
	public ModelAndView updateaddr(@ModelAttribute MemberVO memberVO) {
		memberService.updateaddr(memberVO);
		mav.setViewName("redirect:/member/mypage.mem");
		return mav;
	}
}
