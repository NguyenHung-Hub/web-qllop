package classroom;

public class Classroom {
	private int id;
	private String className;
	private String classAddress;

	public Classroom() {
	}

	public Classroom(String className, String address) {
		this.className = className;
		this.classAddress = address;
	}

	public Classroom(int id, String className, String address) {
		this.id = id;
		this.className = className;
		this.classAddress = address;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getClassAddress() {
		return classAddress;
	}

	public void setClassAddress(String address) {
		this.classAddress = address;
	}

	@Override
	public String toString() {
		return "Classroom [id=" + id + ", className=" + className + ", address=" + classAddress + "]";
	}

}
