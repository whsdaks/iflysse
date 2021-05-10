package com.iflysse.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.iflysse.bean.ClassInfo;
import com.iflysse.bean.ClassTime;
import com.iflysse.bean.Course;
import com.iflysse.bean.Subject;
import com.iflysse.bean.User;
import com.iflysse.dao.CourseDao;
import com.iflysse.dao.TermSetDao;

@Controller
public class CourseController {
	@Autowired
	private CourseDao coursedao;
	
	@Autowired
	private TermSetDao termSetdao;
	
	/*
	 * 查看个人课表
	 */
	@RequestMapping("course")
	public String user_info() {
		return "course";
	}

	/*
	 * 获取当前登录用户的所有课程列表
	 */
	@RequestMapping("courselist")
	public String course_list(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		List<Subject> subject = coursedao.getSubjectByUId(user.getuId());
//		System.out.println("当前登录用户id为："+user.getuId());
		session.setAttribute("subject", subject);
//		System.out.println("当前登录用户课程信息为："+subject);

		return "courseList";
	}

	@RequestMapping("course_next")
	public String next() {
		return "redirect:/classTime";
	}

	/* 添加课表页 */
	@RequestMapping("add_kc")
	public String kc() {
		return "add_subject";
	}

	@RequestMapping("next_step")
	public String next_step() {
		return "redirect:/classTime";
	}

	/*
	 * 新增课表(第一部分）
	 */
	@RequestMapping("new_subject")
	public String newSubject(Subject subject) {
		coursedao.Insertsubject(subject);
		return "redirect:/courselist";
	}

	/*
	 * 通过sid查看course* /
	 */

	@RequestMapping("showCourse")
	public String getSub(Integer sId, HttpServletRequest request) {
		Subject subject = coursedao.getSubjectById(sId);
		List<Course> course = coursedao.showCourse(sId);
		List<ClassTime> cTime = coursedao.showCTime(sId);
		String now = termSetdao.nowadays().split(" ")[0];//获取当前学期
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = new GregorianCalendar();
		Date date = null;
		try {
			date = format.parse(now);//将当前学期转成Date类型
			calendar.setTime(date);//设置时间为当前学期具体日期
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<ClassInfo> classInfo = new ArrayList<ClassInfo>();
		for (int i = 0; i < cTime.size(); i++) {
			calendar.add(Calendar.WEEK_OF_MONTH, Integer.parseInt(cTime.get(i).getWeekTime())-1);//设置时间为当前学期加第几周
			calendar.add(Calendar.DATE, Integer.parseInt(cTime.get(i).getWeek())-1);//设置时间为当前学期加几天
			classInfo.add(new ClassInfo(course.get(i).getContent(), course.get(i).getTarget(),
					course.get(i).getPattern(), course.get(i).getTask(), sId, format.format(calendar.getTime()),
					cTime.get(i).getWeek(), cTime.get(i).getsNumber(), cTime.get(i).getClassRoom()));
			calendar.setTime(date);//重置时间为当前学期具体日期
		}
		request.setAttribute("ci", classInfo);
		request.setAttribute("subject", subject);
		request.setAttribute("course", course);
		return "courseInfo";
	}

	/*
	 * 回显课表信息
	 */
	@RequestMapping("subject_edit")
	public String subjectupdate(Integer sId, HttpServletRequest request) {
		Subject subject = coursedao.getSubjectById(sId);
		request.setAttribute("subject", subject);
		return "subjectEdit";
	}

	/*
	 * 修改课表
	 */
	@RequestMapping("subject_edit_save")
	public String userUpdate(Subject subject) {
//		System.out.println(subject.getsId());
		coursedao.updateSubject(subject);
		
		return "redirect:/courselist";
	}

	/* 添加课程时间页 */
	@RequestMapping("addTime")
	public String add_time(Integer sId, HttpSession session) {
		session.setAttribute("subject", coursedao.getSubjectById(sId));
		return "classTime";
	}

	/*
	 * 添加上课时间
	 */
	@RequestMapping("add_time")
	public String addtime(Integer sId, HttpSession session, 
			@RequestParam(value = "startTime") String[] startTime,
			@RequestParam(value = "endTime") String[] endTime, 
			@RequestParam(value = "sNumber") String[] sNumber,
			@RequestParam(value = "week") String[] week, 
			@RequestParam(value = "classRoom") String[] classRoom) {
		List<String> wTime = new ArrayList<String>();
		for (int i = 0; i < startTime.length; i++) {
			for (int j = Integer.parseInt(startTime[i]); j <= Integer.parseInt(endTime[i]); j++) {
				wTime.add(j + "-" + week[i] + "-" + sNumber[i] + "-" + classRoom[i]);
			}
		}
		for (int k = 0; k < wTime.size(); k++) {
			String[] ct = wTime.get(k).split("-");
			coursedao.insrtclasstime(new ClassTime(ct[0], ct[1], ct[2], ct[3], sId));
		}
		return "redirect:/addTime";
	}
	/* 修改课程时间页 */
	@RequestMapping("time_edit")
	public String edit_time(Integer sId, HttpSession session) {
		session.setAttribute("subject", coursedao.getSubjectById(sId));
		session.setAttribute("classTime",coursedao.showCTime(sId));
		session.setAttribute("tId", coursedao.showT_id());
		return "timeEdit";
	}
	
	/* 保存修改课程时间 */
	@RequestMapping("time_edit_save")
	public String saveTime(Integer sId,Integer tId,
			@RequestParam(value = "weekTime") String weekTime, 	
			@RequestParam(value = "sNumber") String sNumber,
			@RequestParam(value = "week") String week, 
			@RequestParam(value = "classRoom") String classRoom) {
		
			coursedao.upadteTime(new ClassTime(weekTime, week, sNumber, classRoom, sId,tId));

		return "redirect:/time_edit?sId="+sId;
	}
	
	/*
	 * 管理员查看所有用户课程表
	 */
	/*@RequestMapping("all_course")
	public String allcontent() {
		return "allcourse";
	}*/

	/* 添加课程第二部分 */
	@RequestMapping("add_kc1")
	public String addkc1(Integer sId, HttpServletRequest request) {
		Integer classHour = coursedao.getHour(sId);
		Integer hour = classHour / 2;
		Integer[] sb = new Integer[hour];
		for (int i = 0; i < hour; i++) {
			if (i == 0) {
				sb[i] = 1;
				continue;
			}
			sb[i] = i + 1;
		}
		request.setAttribute("sId", sId);
		request.setAttribute("Hour", sb);
//		System.out.println("总课时："+hour);
		return "add_course";
	}

	/*
	 * 保存上课内容
	 */
	@RequestMapping("/save_course")
	public String addscourse(HttpServletRequest request, Integer sId, @RequestParam(value = "content") String[] content,
			@RequestParam(value = "target") String[] target, @RequestParam(value = "pattern") String[] pattern,
			@RequestParam(value = "task") String[] task) {
		Integer classHour = coursedao.getHour(sId);
		System.out.println("classHour=" + classHour);
		Integer hour = classHour / 2;
		System.out.println("content.length=" + content.length);
		System.out.println("content[content.length-1]" + content[content.length - 1]);
		for (int i = 1; i <= hour; i++) {
			int t = i - 1;
			Course course = new Course(content[t], target[t], pattern[t], task[t], sId);
			coursedao.addscourse(course);
		}

		return "redirect:/courselist";
	}
	/*
	 * 修改上课内容
	 */
	@RequestMapping("course_edit")
	public String edit_course(Integer sId,HttpSession session) {
		session.setAttribute("subject", coursedao.getSubjectById(sId));
		session.setAttribute("course", coursedao.showCourse(sId));
		session.setAttribute("cId", coursedao.showC_id(sId));
//		System.out.println(coursedao.showC_id());
		return "courseEdit";
	}
	/*
	 * 保存修改上课内容
	 */
	
	@RequestMapping("course_edit_save")
	public String saveCourse(Integer sId, Integer cId,
			@RequestParam(value = "content") String content,
			@RequestParam(value = "target") String target,
			@RequestParam(value = "pattern") String pattern,
			@RequestParam(value = "task") String task) {
		coursedao.updateCourse(new Course(content, target, pattern, task, sId, cId));
		return "redirect:/course_edit?sId=" + sId;
	}
	/*
	 * 删除课程
	 */
	@RequestMapping("/course_del_batch")
	public String courseDel(Integer[] sId) {
		for(Integer sIds:sId) {
			coursedao.courseDel(sIds);
		}
		return "redircet:/courseList";
	}
	
}
