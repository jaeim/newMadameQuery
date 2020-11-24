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
import controller.user.RegisterUserController;
import controller.user.UpdateUserController;

public class RequestMapping {
    
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	//메인화면
    	mappings.put("/", new ForwardController("/user/mainPage.jsp"));
    	
    	//사용자 -> 스터디 신청 현황 추가해야함
    	mappings.put("/user/register/form", new ForwardController("/user/user_write.jsp"));
    	mappings.put("/user/register", new RegisterUserController());
    	mappings.put("/user/login/form", new ForwardController("/user/login.jsp"));
//    	mappings.put("/user/login", new LoginController());
//    	mappings.put("/user/logout", new LogoutController());
//    	mappings.put("/user/view", new ViewUserController());
//    	mappings.put("/user/update/form", new UpdateUserController());
    	mappings.put("/user/update", new UpdateUserController());
    	
    	//스터디그룹
    	//이건 없애도될듯 -> /studyGroup/myStudy(스터디그룹(멤버)와 겹침)
//    	mappings.put("/studyGroup/myStudy", new ViewUserStudyGroupController());
    	
    	//스터디관리(팀장)
//    	mappings.put("/studyGroup/manageStudy", new StManagerStudyController());
    	mappings.put("/myGroup/manageFroup/delete", new DeleteStudyController());
    	mappings.put("/myGroup/manageGroup/updateForm", new UpdateStudyController());
    	mappings.put("/myGroup/manageGroup/update", new UpdateStudyController());
    	mappings.put("/studyGroup/manageStudy/applyAccept", new ApplyAcceptStudyController());
    	mappings.put("/studyGroup/manageStudyList", new ListManageStudyController());
    	mappings.put("/studyGroup/manageStudy/", new ViewManageStudyController());
    	mappings.put("/studyGroup/manageStudy/delete", new DeleteStudyController());
    	mappings.put("/studyGroup/manageStudy/updateForm", new UpdateStudyController());
    	mappings.put("/studyGroup/manageStudy/update", new UpdateStudyController());
    	mappings.put("/studyGroup/manageStudy/applyAccept", new ApplyAcceptStudyController());
    	
    	//스터디관리(멤버)
    	mappings.put("/studyGroup/myStudy", new ListMyStudyController());
//    	mappings.put("/studyGroup/myStudy/dropOut", new DropOutStudyGroupController());
    	
    	//스터디정보
    	mappings.put("/studyGroup/list", new ListStudyController());
    	mappings.put("/studyGroup/view/", new ViewStudyController());
    	mappings.put("/studyGroup/apply", new ApplyStudyController());
//    	mappings.put("/studyGroup/search", new SearchController());

    	mappings.put("/studyGroup/createForm", new ForwardController("/study/addStudygroup.jsp"));
    	mappings.put("/studyGroup/create", new CreateStudyController());

//    	mappings.put("/studyGroup/createForm", new CreateController());
//    	mappings.put("/studyGroup/create", new ForwardStudyController("/study/addStudygroup.jsp));

    	//게시글
    	mappings.put("/post/list", new ListPostController());
    	mappings.put("/post/detail", new DetailPostController());
    	mappings.put("/post/create/form", new ForwardController("/mystudy/addStudyboard.jsp"));
    	mappings.put("/post/create", new CreatePostController());
    	mappings.put("/post/update/form", new UpdatePostFormController());
    	mappings.put("/post/update", new UpdatePostController());
    	mappings.put("/post/delete", new DeletePostController());
//    	mappings.put("/post/detail", new DetailPostController();
//    	mappings.put("/post/create", new CreateController());
//    	mappings.put("/post/update/form", new UpdateController());
//    	mappings.put("/post/update", new UpdateController());
//    	mappings.put("/post/delete", new DeleteController());

    	
    	
    	//댓글
    	mappings.put("/comment/register", new RegisterCommentController());
    	mappings.put("/comment/delete", new DeleteCommentController());
    	
    }

    public Controller findController(String uri) {	
        return mappings.get(uri);
    }
}
