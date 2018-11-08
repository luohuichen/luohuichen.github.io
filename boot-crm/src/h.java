import java.util.Date;


public class h extends Date{

	public static void main(String[] args) {
		new h().test();

	}
public void test() {
	System.out.println(super.getClass().getName());
	System.out.println(getClass().getSuperclass().getName());
}
}
