package G_T.OfficeSystem.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import G_T.OfficeSystem.model.UserInfoModel;
import G_T.OfficeSystem.model.UserInfoModelDAO;

@Controller

public class UserInfoRegistration {

	@Autowired
	private UserInfoModelDAO userInfoModelDAO;

    @RequestMapping(value="/UserInfoRegister", method= {RequestMethod.GET,RequestMethod.POST})
    public String UserInfoRegister() {
        return "UserInfoRegister"; // GET & POST 모두 지원
    }

    @RequestMapping(value="/registerUser", method = RequestMethod.POST)
    public String registerUser(@ModelAttribute UserInfoModel userInfo) {

    	userInfoModelDAO.insertUser(userInfo);  // DAO를 직접 호출
        return "redirect:/UserInfoSuccess";  // 성공 페이지로 이동
    }

    @RequestMapping(value="/UserInfoSuccess", method= {RequestMethod.GET,RequestMethod.POST})
    public String UserInfoSuccess() {
        return "UserInfoSuccess"; // GET & POST 모두 지원
    }

}