import static org.junit.Assert.*;

import org.junit.Test;

import customTools.DbUser;


public class GravatarTest {

	@Test
	public void test() {
		String gravatarURL = DbUser.getGravatarURL("dave45678@gmail.com", 30);
		System.out.println(gravatarURL);
	}

}
