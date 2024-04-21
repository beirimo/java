package ex08;

public class Main {
	
	public static void main(String[] args) {

		for(int i=2; i<10; i++) {
			if(!(i==2 || i ==7 || i== 8)) {
				continue;
			}
			for (int j=1; j<10; j++) {
				System.out.println(+i + "*" + j + "=" + i*j);
			}
		}			
	}
	
	
}
