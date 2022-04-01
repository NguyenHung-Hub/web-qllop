package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import classroom.Classroom;

public class ClassroomDBUtil {

	@Resource(name = "jdbc/web_QLLop")
	private DataSource dataSource;

	public ClassroomDBUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Classroom> getClassrooms() throws SQLException {

		List<Classroom> classrooms = new ArrayList<>();
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();
			String sql = "select * from classroom ";
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String className = resultSet.getString("className");
				String address = resultSet.getString("classAddress");

				Classroom classroom = new Classroom(id, className, address);

				classrooms.add(classroom);

			}
		} finally {
			closeConnection(connection, statement, resultSet);
		}

		return classrooms;
	}

	public Classroom getClassroom(String id) throws Exception {

		Classroom classroom = null;

		Connection connection = null;
		PreparedStatement preStmt = null;
		ResultSet rs = null;

		int classId;

		try {
			classId = Integer.parseInt(id);

			connection = dataSource.getConnection();
			String sql = "select * from classroom where id = ?";
			preStmt = connection.prepareStatement(sql);
			preStmt.setInt(1, classId);
			rs = preStmt.executeQuery();

			if (rs.next()) {
				String className = rs.getString("className");
				String address = rs.getString("classAddress");

				classroom = new Classroom(className, address);
			} else {
				throw new Exception("Could not found classroom id: " + classId);
			}
			return classroom;
		} finally {
			closeConnection(connection, preStmt, rs);
		}

	}

	public void addClassroom(Classroom classroom) throws Exception {
		Connection connection = null;
		PreparedStatement preStmt = null;

		try {
			connection = dataSource.getConnection();
			String sql = "insert into classroom(className, classAddress) values(?, ?)";

			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, classroom.getClassName());
			preStmt.setString(2, classroom.getClassAddress());

			preStmt.execute();
		} finally {
			closeConnection(connection, preStmt, null);
		}
	}

	public void updateClassroom(Classroom classroom) throws Exception {
		Connection connection = null;
		PreparedStatement preStmt = null;

		try {
			connection = dataSource.getConnection();
			String sql = "update classroom  set className= ?, classAddress=? where id = ?";

			preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, classroom.getClassName());
			preStmt.setString(2, classroom.getClassAddress());
			preStmt.setInt(3, classroom.getId());

			preStmt.execute();
		} finally {
			closeConnection(connection, preStmt, null);
		}
	}

	public void deleteClassroom(String id) throws Exception {
		Connection connection = null;
		PreparedStatement preStmt = null;

		try {

			int idClass = Integer.parseInt(id);
			System.out.println(id);

			connection = dataSource.getConnection();
			String sql = "delete classroom where id = ?";

			preStmt = connection.prepareStatement(sql);
			preStmt.setInt(1, idClass);

			preStmt.execute();
		} finally {
			closeConnection(connection, preStmt, null);
		}
	}

	private void closeConnection(Connection con, Statement stm, ResultSet rs) {
		try {
			if (con != null) {
				con.close();
			}
			if (stm != null) {
				stm.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
