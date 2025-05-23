package G_T.OfficeSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import G_T.OfficeSystem.model.LoginModel;
import G_T.OfficeSystem.model.UserInfoModelDAO;

@Controller
public class LoginController {

	@Autowired
	private UserInfoModelDAO userInfoModelDAO;

	@RequestMapping(value="/Login", method = RequestMethod.GET)
	public String Login() {
		return "Login";
	}

	@RequestMapping(value="/Login", params = {"userId", "password", "email"}, method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public @ResponseBody String Login(
		@RequestParam(value = "userId") String userId,//카쿠노우
		@RequestParam(value = "password") String password,
		@RequestParam(value = "email") String email)
		{



		//ユーザーIDとパスワードがデータベースに存在するかどうかチェック
		Integer count = userInfoModelDAO.CheckUser(new LoginModel(userId, password,email));

		//存在しない場合、ログイン画面に「ユーザーIDまたはパスワードが存在しません」のエラーメッセージを表示する
		if(count == 0) {
			return "ユーザーIDまたはパスワードまたはメールアドレスが存在しません";

		}

		return "";
	}
}
