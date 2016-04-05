<?php


namespace Appraise\Controller;

use Think\Controller;

class IndexController extends Controller
{
    
   
    public function index()
    {
		$teacherIds=M("userRole")->where(array('status'=>1,'role_id'=>2))->getField('uid',true);
        $teachers=M("member")->where(array('uid'=>array('in',$teacherIds)))->select();
        //var_dump($teachers);
		$this->assign('teachers',$teachers);
        $this->display();
    }
	public function selectLesson($uid=0){
		$uid = intval($uid);
	    if(!$uid)
	    {
	        $this->error("参数错误！");
	    }
		$loginUid=is_login();//取得当前已登录用户的uid
		//echo($loginUid);
	    if(!$loginUid)
	    {
	        $this->error("您尚未登录！",U("/ucenter/member/login"));
	    }
		 //判断是否是学生
	    if(!(M("userRole")->where(array('status'=>1,'role_id'=>3,'uid'=>$loginUid))->find()))
	    {
	        $this->error("只有学生才可以评价！");
	    }
		//取得该老师的所有课程ID
	    $teacherLessonIds=M('appraiseTeacherLesson')->where(array('uid'=>$uid))->getField('lessonId',true);
		//var_dump($teacherLessonIds);
		//取得该学生选修该老师的所有课程的ID
	    $studentLessonIds=M('appraiseStudentLesson') ->where(array('uid'=>$loginUid,'lessonId'=>array('in',$teacherLessonIds)))
		->getField('lessonId',true);
		if(!$studentLessonIds)
	    {
	        $this->error("您未选修该老师的课程，无法评价");
	    }
		$lessons=M("appraiseLesson")->where(array("id"=>array(in,$studentLessonIds)))->select();
	    $this->assign('uid',$uid);
		$this->assign('lessons',$lessons);
	    $this->display();
	}
	public function selectSession($uid=0,$lessonId=0){
		//参数检查
	    $uid = intval($uid);
	    if(!$uid)
	    {
	        $this->error("参数错误！");
	    }
		$loginUid=is_login();//取得当前已登录用户的uid
		//echo($loginUid);
	    if(!$loginUid)
	    {
	        $this->error("您尚未登录！",U("/ucenter/member/login"));
	    }
		 //判断是否是学生
	    if(!(M("userRole")->where(array('status'=>1,'role_id'=>3,'uid'=>$loginUid))->find()))
	    {
	        $this->error("只有学生才可以评价！");
	    }
		
		if(!M('appraiseTeacherLesson')->where(array('uid'=>$uid,'lessonId'=>$lessonId))->find()){
			$this->error("参数异常");
		}
		if(!M('appraiseStudentLesson')->where(array('uid'=>$loginUid,'lessonId'=>$lessonId))->find()){
			$this->error("参数异常");
		}
		$sessions=M("appraiseSession")->where(array("lessonId"=>$lessonId))->select();
		
		$this->assign("uid",$uid);
		$this->assign("lessonId",$lessonId);
		$this->assign("sessions",$sessions);
		$this->display();
	}
	public function doAppraise($uid=0,$lessonId=0,$sessionId=0,$point=0,$content='',$anonymous=0){
		$loginUid=is_login();//取得当前已登录用户的uid
	    if(!$loginUid)
	    {
	        $this->error("您尚未登录！",U("/ucenter/member/login"));
	    }
		$appraise=M('appraise')->create();
		$appraise['studentId']=$loginUid;
		$appraise['teacherId']=$uid;
		$appraise['createTime']=time();
		M('appraise')->add($appraise);
		$this->success("评价成功",U('index'));
	}
	public function showAppraise($uid=0){
		//参数检查
	    $uid = intval($uid);
	    if(!$uid)
	    {
	        $this->error("参数错误！");
	    }
		$teacher=query_user(array('id','username','nickname','space_url','space_link','avatar64','rank_html','signature'));
		$point=M("appraise")->where(array('teacherId'=>$uid))->avg("point");
		$appraises=D("appraise")->relation('student')->where(array("teacherId"=>$uid))->select();
		//var_dump($appraises);
		$this->assign("uid",$uid);
		$this->assign("teacher",$teacher);
		$this->assign("point",$point);
		$this->assign("appraises",$appraises);
		$this->display();
	}
	/*public function appraise($uid=0)
	{
	    //参数检查
	    $uid = intval($uid);
	    if(!$uid)
	    {
	        $this->error("参数错误！");
	    }
		$loginUid=is_login();//取得当前已登录用户的uid
		//echo($loginUid);
	    if(!$loginUid)
	    {
	        $this->error("您尚未登录！",U("/ucenter/member/login"));
	    }
		 //判断是否是学生
	    if(!(M("userRole")->where(array('status'=>1,'role_id'=>3,'uid'=>$loginUid))->find()))
	    {
	        $this->error("只有学生才可以评价！");
	    }
		//取得该老师的所有课程ID
	    $teacherLessonIds=M('appraiseTeacherLesson')->where(array('uid'=>$uid))->getField('lessonId',true);
		//var_dump($teacherLessonIds);
		//取得该学生选修该老师的所有课程的ID
	    $studentLessonIds=M('appraiseStudentLesson') ->where(array('uid'=>$loginUid,'lessonId'=>array('in',$teacherLessonIds)))
		->getField('lessonId',true);
		if(!$studentLessonIds)
	    {
	        $this->error("您未选修该老师的课程，无法评价");
	    }
		 //查询课程可评价时段
	    $appraiseSessions=M('appraiseSession')->where(array('lessonId'=>array('in',$studentLessonIds)))->select();
	    $currentTime=time();//取得当前时间
	    $canAppraise=false;
	    foreach($appraiseSessions as $v)
	    {
	        if($v['sTime']<$currentTime && $v['eTime']>$currentTime)
	        {
	            $canAppraise=true;
	            break;
	        }
	    }
	    $this->assign('uid',$uid);
	    $this->assign('appraiseSessions',$appraiseSessions);
	    $this->assign('canAppraise',$canAppraise);
	    $this->display();
	}*/
    
}
