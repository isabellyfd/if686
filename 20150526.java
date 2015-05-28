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


import java.util.Scanner;
/* nesse casso acima as saidas se misturam pela 
concorrencia das threads, competindo pelo processador. 
O escalonador escolhe as threads pelo processo "aleatóriamente" 
então nunca será deterministica a saida desse programa*/
public  class Exer {
	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		int x, n;
		System.out.println("Number of threads:");
		n = in.nextInt();
		System.out.println("Maximum:");
		x = in.nextInt();

		Thread[] t = new Thread[n];
		for (int i = 0 ; i < n  ; i++ ) {
		 	t[i] =  new Thread(new Printer(x));
		 	t[i].start();
		 } 


	}
}

class Printer implements Runnable {
	int counter;
	int end;

	public Printer(int x){
		end = x;
	}

	public void run(){
		while (counter <= end){
			System.out.println(counter);
			counter++;
		}
	}
}

import java.util.Scanner;
/*O contador por ser impresso com o mesmo valor varias vezes
já que a variavel é global e n há nenhum tipo de controle sobre
quem esta lendo ou escrevendo, não há uma proteção nessa variavel*/
public  class Exer1 {
	static int counter;

	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		int x, n;
		System.out.println("Number of threads:");
		n = in.nextInt();
		System.out.println("Maximum:");
		x = in.nextInt();
		
		Thread[] t = new Thread[n];
		for (int i = 0 ; i < n  ; i++ ) {
		 	t[i] =  new Thread(new Printer(x));
		 	t[i].start();
		 } 


	}
	static public class Printer implements Runnable {
	
		int end;

		public Printer(int x){
			end = x;
		}

		public void run(){
			while (counter <= end){
				System.out.println(counter);
				counter++;
			}
		}
	}
}
import java.util.Scanner;
import java.util.concurrent.atomic.AtomicInteger;
//dont know if i get it right;
//nada mudoooooou lol??
public  class Exer2 {
	ThreadId f = new ThreadId();
	static int counter = f.get();

	public static void main(String[] args){
		Scanner in = new Scanner(System.in);
		int x, n;
		System.out.println("Number of threads:");
		n = in.nextInt();
		System.out.println("Maximum:");
		x = in.nextInt();
		
		Thread[] t = new Thread[n];
		for (int i = 0 ; i < n  ; i++ ) {
		 	t[i] =  new Thread(new Printer(x));
		 	t[i].start();
		 } 


	}
	static public class Printer implements Runnable {
	
		int end;

		public Printer(int x){
			end = x;
		}

		public void run(){
			while (counter <= end){
				System.out.println(counter);
				counter++;
			}
		}
	}
}
class ThreadId {
    
     private static final AtomicInteger nextId = new AtomicInteger(0);

     // Thread local variable containing each thread's ID
     private static final ThreadLocal<Integer> threadId =
         new ThreadLocal<Integer>() {
             @Override protected Integer initialValue() {
                 return nextId.getAndIncrement();
         }
     };

     // Returns the current thread's unique ID, assigning it if necessary
     public static int get() {
         return threadId.get();
     }
 }