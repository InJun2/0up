package com.kh.oup.sale.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oup.common.PageVo;
import com.kh.oup.employee.vo.EmployeeVo;
import com.kh.oup.mail.vo.MailVo;
import com.kh.oup.sale.service.SaleService;
import com.kh.oup.sale.vo.SaleListVo;
import com.kh.oup.sale.vo.SaleVo;

@Controller
@RequestMapping("/sale")
public class SaleController {
	
	@Autowired
	private SaleService service;
	
	@GetMapping("/enter")
	public String saleEnter() {
		return "pages/sale/saleEnter";
	}
	
	@PostMapping("/enter")
	public String saleEnter(@ModelAttribute SaleVo saleVo, @ModelAttribute SaleListVo saleListVo) throws Exception {
		
//		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
//			System.out.println(saleListVo.getVoList().get(i));
//		}
		
		long saleNo = service.getSeq();
		saleVo.setSaleNo(saleNo);
		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
			saleListVo.getVoList().get(i).setSaleNo(saleNo);
		}
		
		int result = service.saleEnter(saleVo, saleListVo);
		
		int result2 = service.clientAddUmony(saleVo.getCNo(), saleVo.getSUmoney());
		
		return "redirect:/sale/enter";
	}
	
	@GetMapping(value = {"/list/{page}", "/list"})
	public String saleList(Model model, @PathVariable(required = false)String page, HttpServletRequest request) throws Exception {
		if(page == null || Integer.parseInt(page) <= 0 )
			page = "1";
		
		int totalRow = service.getSaleCnt();
		PageVo vo = new PageVo(page, totalRow);
		vo.setCntPerPage(10);
		
		//판매번호(O), 거래처, 담당자명, 품목이름, 폼목개수, 창고이름
		List<SaleVo> list = service.getSaleList(vo);
		
		model.addAttribute("list",list);
		model.addAttribute("page", vo);
		return "pages/sale/saleList";
	}
	
	@GetMapping("/saleDetail/{saleNo}")
	public String saleDetail(@PathVariable int saleNo, Model model) throws Exception {
		SaleVo saleVo = service.getSale(saleNo);
		model.addAttribute("sale", saleVo);
		
		SaleListVo saleListVo = service.getSaleProductList(saleNo);
		model.addAttribute("saleList", saleListVo.getVoList());
		int cnt = saleListVo.getVoList().size();
		model.addAttribute("cnt", cnt);
		model.addAttribute("saleNo", saleNo);
		
		return "pages/sale/saleDetail";
	}
	
	@PostMapping("/saleUpdate/{saleNo}")
	public String saleUpdate(Model model, @PathVariable int saleNo, @ModelAttribute SaleVo saleVo, @ModelAttribute SaleListVo saleListVo) throws Exception {
		
		saleVo.setSaleNo(saleNo);
		for(int i = 0; i < saleListVo.getVoList().size(); i++) {
			saleListVo.getVoList().get(i).setSaleNo(saleNo);
		}
		
		int result = service.saleUpdate(saleVo);
		
		int result2 = service.saleListUpdate(saleListVo);
		
		return "pages/sale/popupClose2";
	}
	
}
