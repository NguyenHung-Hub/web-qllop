package controllers;

import java.io.IOException;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;

import classroom.Classroom;

import utils.ClassroomDBUtil; 


@WebServlet("/ClassroomControllerServlet")
public class ClassroomControllerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private ClassroomDBUtil classroomDBUtil;   

	@Resource(name = "jdbc/web_QLLop")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();

		try {
			classroomDBUtil = new ClassroomDBUtil(dataSource);
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String theCommand = req.getParameter("command");

			if (theCommand == null) {
				theCommand = "LIST";
			}

			switch (theCommand) {
			case "LIST": {
				System.out.println("LIST class");

				listClassroom(req, resp);
				break;
			}
			case "ADD": {

				addClassroom(req, resp);
				System.out.println("ADD \n");
				break;
			}
			case "LOAD": {

				loadClassroom(req, resp);
				break;
			}
			case "UPDATE": {

				updateClassroom(req, resp);
				break;
			}
			case "DELETE": {
				System.out.println("DELETE");

				deleteClassroom(req, resp);
				break;
			}

			default: {
				System.out.println("switch default");
				listClassroom(req, resp);
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void listClassroom(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<Classroom> classrooms = classroomDBUtil.getClassrooms();

		req.setAttribute("CLASSROOM_LIST", classrooms);
		System.out.println(classrooms.get(0));

		RequestDispatcher dispatcher = req.getRequestDispatcher("list-class.jsp");
		dispatcher.forward(req, res);
	}

	private void addClassroom(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String className = req.getParameter("className");
		String address = req.getParameter("classAddress");

		Classroom classroom = new Classroom(className, address);

		classroomDBUtil.addClassroom(classroom);

		listClassroom(req, res);
	}

	private void loadClassroom(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("classroomId");
		Classroom classroom = classroomDBUtil.getClassroom(id);

		req.setAttribute("THE_CLASSROOM", classroom);
		RequestDispatcher dispatcher = req.getRequestDispatcher("update-class-form.jsp");
		dispatcher.forward(req, res);

	}

	private void updateClassroom(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int id = Integer.parseInt(req.getParameter("classroomId"));
		String className = req.getParameter("className");
		String address = req.getParameter("classAddress");

		Classroom classroom = new Classroom(id, className, address);
		classroomDBUtil.updateClassroom(classroom);

		listClassroom(req, res);

	}

	private void deleteClassroom(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("classroomId");
		classroomDBUtil.deleteClassroom(id);
		listClassroom(req, res);
	}

	// hiển thị danh sách lớp
//	private void showStudentClassroom(HttpServletRequest req, HttpServletResponse res) throws Exception {
//		int idClass = Integer.parseInt(req.getParameter("classroomId"));
//		List<Student> students = studentDBUtil.getStudentsByClass(idClass);
//
//		req.setAttribute("STUDENT_LIST", students); 
//
//		RequestDispatcher dispatcher = req.getRequestDispatcher("list-student.jsp"); 
//		dispatcher.forward(req, res);     
//	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
