package com.kh.oup.approval.service;

import java.io.File;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oup.approval.dao.ApprovalDao;
import com.kh.oup.approval.vo.ApprovalVo;
import com.kh.oup.common.PageVo;
import com.kh.oup.employee.vo.EmployeeVo;
import com.kh.oup.mail.vo.MailVo;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	private ApprovalDao dao;
	
	@Override
	public int appSend(ApprovalVo vo, HttpServletRequest req) throws Exception {
		Random random = new Random();
		
		MultipartFile file = vo.getAttachment();
		
		if(file.getOriginalFilename() != "") {
			String path = req.getServletContext().getRealPath("/resources/dist/img/approval/");
			String chargeName = System.currentTimeMillis() + "_" + random.nextInt() + "_" + file.getOriginalFilename();
			vo.setChangeName(chargeName);
			vo.setOriginName(file.getOriginalFilename());
			
			File newfile = new File(path + chargeName);
			file.transferTo(newfile);
		}
		
		int result = dao.appSend(vo);
		
		return result;
	}

	@Override
	public int getSendAppCnt(String loginName) throws Exception {
		return dao.getSendAppCnt(loginName);
	}

	@Override
	public List<ApprovalVo> getSendApprovalList(PageVo vo, String loginName) throws Exception {
		List<ApprovalVo> list = dao.getSendApprovalList(vo, loginName);
		
		return list;
	}

	@Override
	public List<ApprovalVo> getReceiveApprovalList(PageVo vo, String loginjobTitleCode) throws Exception {
		List<ApprovalVo> list = dao.getReceiveApprovalList(vo, loginjobTitleCode);
		
		return list;
	}

	@Override
	public int getCompleteAppCnt(String loginName) throws Exception {
		return dao.getCompleteAppCnt(loginName);
	}

	@Override
	public int getReceiveAppCnt(String loginjobTitleCode) throws Exception {
		return dao.getReceiveAppCnt(loginjobTitleCode);
	}

	@Override
	public List<ApprovalVo> getCompleteApprovalList(PageVo vo, String loginName) throws Exception {
		List<ApprovalVo> list = dao.getCompleteAppList(vo, loginName);
		
		return list;
	}

	@Override
	public ApprovalVo getApproval(int ano) throws Exception {
		ApprovalVo app = dao.getApproval(ano);
		
		return app;
	}

	@Override
	public int getorderNo(int ano) throws Exception {
		return dao.getOrderNo(ano);
	}

	@Override
	public int getProjectNo(int aDocNo) throws Exception {
		return dao.getProjectNo(aDocNo);
	}

	@Override
	public int appCheck(ApprovalVo approval, EmployeeVo loginEmployee) throws Exception {
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		//????????? ??? ??????
		String teamCode = dao.getTeamCode(approval.getAPicName());
		
		//????????? ?????? ?????????
		String leaderNo = dao.getTeamLeaderNo(teamCode);
		
		//?????? ????????? ?????? ????????? ????????? ?????? ???????????? ??????
		if(leaderNo.equals(String.valueOf(loginEmployee.getEmployeeNo()))) {
			//???????????? ?????? 
			result1 = dao.appTeamY(approval);
		}
		
		//???????????? ???????????? ???????????? ?????????
		String decCode = dao.getDecCode(approval.getDcCode());
		//?????????????????? ??????
		if(decCode.equals(loginEmployee.getJobTitleCode())) {
			//???????????? ??????
			result2 = dao.appDecY(approval);
		}
		
		//???????????? ???????????? ???????????? ?????????
		String allCode = dao.getallCode(approval.getDcCode());
		//?????????????????? ??????
		if(allCode.equals(loginEmployee.getJobTitleCode())) {
			//???????????? ??????
			result3 = dao.appAllY(approval);
		}
		
		int result = result1 + result2 + result3;
		System.out.println(result);
		return result;
	}

	@Override
	public int StatementY(ApprovalVo newApp) throws Exception {
		return dao.statementY(newApp);
	}


}
