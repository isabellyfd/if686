//studing for plc
import java.util.Scanner;

public class AllPrim extends Thread{
	int begin;
	int end;

	AllPrim (i){
		begin = b;
		end = e;
	}

	public boolean isPrim( int a ){
		if ( a < 2 ){
			return false;
		}else if ( a == 2){
			return true;
		}else{
			int aux = 2;

			while (true){
				if ( a%aux == 0){
					return false;
				}
				if (a == aux) break;
				aux++;
			}
			return true;
		}
	}

	public void run(){
		int count = this.begin;

		while ( count < this.end){
			if (isPrim(count)) System.out.print(count)

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
		int intervalo = end/ threads;

		AllPrim t = new AllPrim[threads];
		for (int i = 0; i < threads ; i++) {
			t[i] =  new AllPrim(begin, intervalo);
			begin =  intervalo + 1;
			intervalo += (intervalo +1);
		}
	}
}