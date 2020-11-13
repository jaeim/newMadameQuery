package controller;

import java.util.HashMap;
import java.util.Map;

public class RequestMapping {
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {
    	//메인화면
    	mappings.put("/", new ForwardController("/user.mainPage.jsp"));
    	
    	//사용자
    	mappings.put("/user/register/form", new ForwardController("/user.user_write.jsp"));
//    	mappings.put("/user/register", new RegisterUserController());
    	mappings.put("/user/login/form", new ForwardController("/user.login.jsp"));
//    	mappings.put("/user/login", new LoginController());
//    	mappings.put("/user/logout", new LogoutController());
//    	mappings.put("/user/view", new ViewUserController());
//    	mappings.put("/user/update/form", new UpdateUserController());
//    	mappings.put("/user/update", new UpdateUserController());
    	
    	//스터디그룹
//    	mappings.put("/studyGroup/myStudy", new ViewUserStudyGroupController());
    	
    	//스터디관리(팀장)
//    	mappings.put("/studyGroup/manageStudy", new StManagerStudyController());
//    	mappings.put("/myGroup/manageFroup/delete", new DeleteStudyController());
//    	mappings.put("/myGroup/manageGroup/updateForm", new UpdateStudyController());
//    	mappings.put("/myGroup/manageGroup/update", new UpdateStudyController());
//    	mappings.put("/studyGroup/manageStudy/applyAccept", new ApplyAcceptStudyController());
    	
    	//스터디관리(멤버)
//    	mappings.put("/studyGroup/myStudy", new ListMyStudyController());
//    	mappings.put("/studyGroup/myStudy/dropOut", new DropOutStudyController());
    	
    	//스터디정보
//    	mappings.put("/studyGroup/list", new ListStudyController());
//    	mappings.put("/studyGroup/view/", new ViewStudyController());
//    	mappings.put("/studyGroup/apply", new ApplyController());
//    	mappings.put("/studyGroup/search", new SearchController());
//    	mappings.put("/studyGroup/createForm", new CreateController());
//    	mappings.put("/studyGroup/create", new CreateStudyController());
    	
    	//게시글
//    	mappings.put("/post/list", new ListPostController();
//    	mappings.put("/post/create/form", new CreateController());
//    	mappings.put("/post/create", new CreateController();
//    	mappings.put("/post/update/form", new UpdateController();
//    	mappings.put("/post/update", new UpdateController();
//    	mappings.put("/post/delete", new DeleteController();
//    	mappings.put("/post/detail", new DetailPostController();
    	
    	
    	//댓글
//    	mappings.put("/comment/register", new RegisterCommentController());
//    	mappings.put("/comment/delete", new DeleteCommentController());
    	
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}
