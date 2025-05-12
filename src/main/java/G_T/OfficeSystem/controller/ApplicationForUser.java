package G_T.OfficeSystem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import G_T.OfficeSystem.model.ApplicationConditionModel;
import G_T.OfficeSystem.model.ApplicationModel;

@Controller
public class ApplicationForUser {

    @Autowired
    ApplicationModel ApplicationModel;

    @RequestMapping (value = "/ApplicationManage", method = RequestMethod.GET)
    public String ApplicationManage () {
        return "ApplicationManage";
    }

    @RequestMapping (value = "/GetPage2", method = RequestMethod.POST)
    public String GetPage (HttpSession session, ApplicationConditionModel condition, Model model) {

        ApplicationModel.FindApplication (condition);
        model.addAttribute ("ApplicationInfoModel", ApplicationModel);

        return ("_ApplicationList");
    }

    @RequestMapping (value = "/GetPage3", method = RequestMethod.POST)
    public String GetPage (HttpSession session, Model model, @RequestParam int showNumber,
            @RequestParam int currentPage) {

        ApplicationModel.GetPage3 (showNumber, currentPage);
        model.addAttribute ("ApplicationInfoModel", ApplicationModel);

        return ("_ApplicationList");
    }

    @RequestMapping (value = "/Sort2", method = RequestMethod.POST)
    public String Sort (HttpSession session, Model model, @RequestParam String sortColumn,
            @RequestParam String sortOrder) {
        ApplicationModel.Sort (sortColumn, sortOrder);
        model.addAttribute ("ApplicationInfoModel", ApplicationModel);
        return ("_ApplicationList");
    }
}
