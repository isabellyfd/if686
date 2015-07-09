//studing for plc
import java.util.Scanner;

public class AllPrim extends Thread{
	int begin;
	int end;
	int max;

	AllPrim (int b, int e, int max){
		begin = b;
		end = e;
		this.max =  max;
	}

	public boolean isPrim( int a ){
		if ( a < 2 ){
			return false;
		}else if ( a == 2){
			return true;
		}else{
			int aux = 2;
			boolean flag = true;
			while (flag && aux < a){
				if(a%aux == 0 ){
					flag =  false;
				}
				aux++;
			}
			return flag;
		}
	}

	public void run(){
		int count = this.begin;

		while ( count < this.end){
			if (isPrim(count)) System.out.print(count + " ");

			count++;
		}
	}


	public static void main (String[] args){
		Scanner in = new Scanner(System.in);
		System.out.println("N:");
		int end = in.nextInt();
		System.out.println("T:");
		int threads =  in.nextInt();

		int begin = 1;
		int intervalo = end/ threads, inter = intervalo;

		AllPrim[] t = new AllPrim[threads];
		for (int i = 0; i < threads ; i++) {
			t[i] =  new AllPrim(begin, inter, end);
			t[i].start();
			begin =  inter + 1;
			inter = inter + intervalo;
		}
	}
}