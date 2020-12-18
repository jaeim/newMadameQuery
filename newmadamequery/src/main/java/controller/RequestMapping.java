package controller;

import java.util.HashMap;
import java.util.Map;
import controller.group.*;
import controller.post.*;
import controller.*;
import controller.comment.*;
import controller.group.*;
import controller.post.DetailPostController;
import controller.post.ListPostController;
import controller.user.*;


public class RequestMapping {
    
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	//메인화면
    	mappings.put("/", new ForwardController("index.jsp"));
    	
    	//사용자
    	mappings.put("/user/mainPage", new ForwardController("/user/mainPage.jsp"));
    	mappings.put("/user/register/form", new ForwardController("/user/user_write.jsp"));
    	mappings.put("/user/register", new RegisterUserController());
    	mappings.put("/user/login/form", new ForwardController("/user/login.jsp"));
    	mappings.put("/user/login", new LoginController());
    	mappings.put("/user/logout", new LogoutController());
    	mappings.put("/user/view", new ViewUserController());
    	mappings.put("/user/update/form", new UpdateUserController());
    	mappings.put("/user/update", new UpdateUserController());
    	mappings.put("/user/home", new GoToHomeController());
    	
    	//스터디관리(팀장)
    	mappings.put("/studyGroup/manageStudyList", new ListManageStudyController());
    	mappings.put("/studyGroup/manageStudy", new ViewManageStudyController());
    	mappings.put("/studyGroup/manageStudy/delete", new DeleteStudyController());
    	mappings.put("/studyGroup/manageStudy/update/form", new UpdateStudyController());
    	mappings.put("/studyGroup/manageStudy/update", new UpdateStudyController());
    	mappings.put("/studyGroup/manageStudy/applyAccept", new ApplyAcceptStudyController());
    	
    	//스터디관리(멤버)
    	mappings.put("/studyGroup/myApplyList", new ApplyListController());
    	mappings.put("/studyGroup/myStudy", new ListMyStudyController());
    	mappings.put("/studyGroup/myStudy/dropOut", new DropoutStudyController());
    	
    	//스터디정보
    	mappings.put("/studyGroup/list", new ListStudyController());
    	mappings.put("/studyGroup/view", new ViewStudyController());
    	mappings.put("/studyGroup/apply", new ApplyStudyController());
    	mappings.put("/studyGroup/create/form", new ForwardController("/study/addStudygroup.jsp"));
    	mappings.put("/studyGroup/create/form", new CreateStudyController());
    	mappings.put("/studyGroup/create", new CreateStudyController());
    	mappings.put("/studyGroup/search/form", new ForwardController("/study/searchStudygroup.jsp"));
    	mappings.put("/studyGroup/search", new SearchStudyController());


    	//게시글
    	mappings.put("/post/list", new ListPostController());
    	mappings.put("/post/detail", new DetailPostController());
    	//mappings.put("/post/create/form", new ForwardController("/myStudy/addStudyboard.jsp"));
    	mappings.put("/post/create/form", new CreatePostController());
    	mappings.put("/post/create", new CreatePostController());
    	mappings.put("/post/update/form", new UpdatePostFormController());
    	mappings.put("/post/update", new UpdatePostController());
    	mappings.put("/post/delete", new DeletePostController());
    	
    	
    	//댓글
    	mappings.put("/comment/register", new RegisterCommentController());
    	mappings.put("/comment/delete", new DeleteCommentController());
    	
    }

    public Controller findController(String uri) {
        return mappings.get(uri);
    }
}
