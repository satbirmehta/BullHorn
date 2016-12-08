import static org.junit.Assert.*;

import org.junit.Test;
import model.Bhuser;
import customTools.DbUser;
public class BhUserTest {

	@Test
	public void test() {
		
		assertTrue(1 == 2);
		
		
	}
	
	@Test
	public void getUserByEmail() {
		Bhuser u = DbUser.getUserByEmail("user1@domain.com");
		System.out.println(u.getBhuserid());
		//assertTrue(u.getUsername().equals("user 1"));
		assertTrue(u.getBhuserid()==1);
	}

}
