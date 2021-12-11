package com.example.demo.controllor;

import com.example.demo.mod.UserInfo;
import com.example.demo.service.Check;
import com.example.demo.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class UpateOneUserController {
    @Autowired
  UserInfoService userInfoService;


    @Value("${maxCountNumberName}")
    Integer maxCountNumberName;
    @Value("${maxCountNumberEmail}")
    Integer maxCountNumberEmail;
@PostMapping("/updateOneUser")
    public String updateOneUser(@RequestParam("account") String Account, @RequestParam("name") String Name, @RequestParam("email") String Email, @RequestParam("id") String ID, RedirectAttributes redirectAttributes, HttpSession httpSession){
int i=0;

//check
    //check


    if (Check.isNullOrIsEmpty(Name.trim())) {
        redirectAttributes.addFlashAttribute("UpateOneUser", "姓名不能為空");
        return "redirect:main.html";
    }
    if(Check.isOvermaxCountNumberName(Name.trim().length())){
        redirectAttributes.addFlashAttribute("UpateOneUser", "姓名字數超過"+maxCountNumberName+"字");
        return "redirect:main.html";
    }
    if (Check.isNullOrIsEmpty(Email)) {
        redirectAttributes.addFlashAttribute("UpateOneUser", "Email不能為空");
        return "redirect:main.html";
    }
    if(Check.isOvermaxCountNumberEmail(Email.trim().length())){
        redirectAttributes.addFlashAttribute("UpateOneUser", "Email字數超過"+maxCountNumberEmail+"字");
        return "redirect:main.html";
    }

    if (!Check.isGoodEmail(Email)) {
        redirectAttributes.addFlashAttribute("UpateOneUser", "Email格式不對");
        return "redirect:main.html";
    }

    //check





//check

    try {
     i = userInfoService.UpateOneUser(Account, Name, Email, ID);
}catch (Exception e){

        redirectAttributes.addFlashAttribute("UpateOneUser","錯誤，請正常使用本網站");
}
    if(i>0){

        UserInfo userInfo = userInfoService.getOneuserInfoByID(ID);
        redirectAttributes.addFlashAttribute("UpateOneUser","成功更改個人資訊");
        httpSession.setAttribute("LoginUser",userInfo);

    }else {

        redirectAttributes.addFlashAttribute("UpateOneUser","沒有更改個人資訊");
    }

    return "redirect:main.html";
}
}
