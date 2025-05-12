package G_T.OfficeSystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import G_T.OfficeSystem.model.FindConditionModel;
import G_T.OfficeSystem.model.FindModel;

@Controller
public class FindUserController{
	@Autowired
	FindModel findModel;

	@RequestMapping(value="/Find", method=RequestMethod.GET)
	public String Find() {
		return "Find";
	}

	@RequestMapping(value="/Find", method = RequestMethod.POST)
	public String Find(HttpSession session, FindConditionModel condition, Model model) {
		//session가 페이지의 정보의 일시적인유지,condition가 입력한 정보(안의 데이터),model가 콘트로러 뷰의 데이터 주고받기
		findModel.FindUser(condition);
		model.addAttribute("findModel", findModel);//jsp에 데이터를 전달

		return("_FindResult");//_FindResult로 반환(명령)갱신 해주세요라는 명령
	}

	@RequestMapping(value="/GetPage",method=RequestMethod.POST)
	public String GetPage(HttpSession session, Model model
			,@RequestParam int showNumber
			,@RequestParam int currentPage) {

		findModel.GetPage(showNumber, currentPage);
		model.addAttribute("findModel",findModel);

		return ("_FindResult");
	}

	@RequestMapping(value="/Sort",method=RequestMethod.POST)
	public String Sort(HttpSession session, Model model
		,@RequestParam String sortColumn
		,@RequestParam String sortOrder){

			findModel.Sort(sortColumn, sortOrder);
			model.addAttribute("findModel",findModel);

			return("_FindResult");
		}
}