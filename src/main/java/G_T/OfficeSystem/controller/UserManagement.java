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

public class UserManagement {

    @Autowired
    private FindModel findModel;

    @RequestMapping(value="/UserManage", method={RequestMethod.GET, RequestMethod.POST})
    public String UserManage(Model model) {
        return "UserManage"; // GET & POST 모두 지원
    }


    @RequestMapping(value="/ChangeStatus", method=RequestMethod.POST)
    public String ChangeStatus(HttpSession session, FindConditionModel condition, Model model) {


        findModel.FindUser(condition);
        model.addAttribute("findModel", findModel);

        return "_UserManageList";
    }
    @RequestMapping(value="/GetGetPage",method=RequestMethod.POST)
	public String GetPage(HttpSession session, Model model
			,@RequestParam int showNumber
			,@RequestParam int currentPage) {

		findModel.GetPage(showNumber, currentPage);
		model.addAttribute("findModel",findModel);

		return ("_UserManageList");
	}
    @RequestMapping(value="/SortSort",method=RequestMethod.POST)
	public String Sort(HttpSession session, Model model
		,@RequestParam String sortColumn
		,@RequestParam String sortOrder){

			findModel.Sort(sortColumn, sortOrder);
			model.addAttribute("findModel",findModel);

			return("_UserManageList");
		}

    // 🔹 상태 변경 처리 엔드포인트 추가
    /*@RequestMapping(value="/ChangeStatus", method=RequestMethod.POST)
    public String ChangeStatus(@RequestParam("status") String status, Model model) {
        // 선택된 상태를 기반으로 사용자 목록 조회
        findModel.FilterUsersByStatus(status);

        // 모델에 필터링된 사용자 목록 추가
        model.addAttribute("findModel", findModel);

        // 업데이트된 사용자 목록을 표시할 JSP 페이지 반환
        return "_UserManageList"; // HTML 업데이트를 위한 JSP 반환
    }*/
}