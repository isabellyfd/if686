public class Joia {


	public static void main(String[] args){
		long ini =  System.currentTimeMillis();
		Thread[] t =  new Imprimir[10];
		long num = 2000000000;
		long counter= 1;
		long sum = (num/10);


		for (int i = 0; i < 10 ; i++) {
			t[i] = new Imprimir (counter, sum);
			t[i].start();
			counter = sum+1;
			sum += sum;
		}
		long fim = System.currentTimeMillis();
		double d = (fim-ini)/1000;
		System.out.println(d);
	}
}

class Imprimir extends Thread{
	long ini;
	long end;

	public Imprimir( long ini, long end){
		this.ini = ini;
		this.end = end;
	} 

	public void run (){
		while (this.ini <= this.end)
		{
			
			ini++;
		}
	}
}