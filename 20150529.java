import java.util.Scanner;

public class Trabalho{
	static int x, y, z;
	static int[][] matrixXY;
	static int[][] matrixYZ;
	static int[][] finalMatrix;

	public static void main(String[] args){
		
		Scanner in = new Scanner(System.in);
		System.out.println("X:");
		x = in.nextInt();
		System.out.println("Y:");
		y = in.nextInt();
		System.out.println("Z:");
		z = in.nextInt();

		matrixXY =  new int[x][y];
		matrixYZ = new int[y][z];
		finalMatrix =  new int [x][z];

		System.out.println("Preencha a matriz X x Y");
		for (int i = 0; i < x; i++){
			for (int j = 0; j < y ; j++) {
				matrixXY[i][j] = in.nextInt();
			}
		}

		System.out.println("Preencha a matriz Y x z");
		for (int i = 0; i < y; i++){
			for (int j = 0; j < z ; j++) {
				matrixYZ[i][j] = in.nextInt();
			}
		}

		for (int i = 0; i< x ; i++ ) {
			for (int j = 0; j < z ; j++ ) {
				finalMatrix[i][j] = -1;
			}
		}

		System.out.println("N threads:");
		int n = in.nextInt();
		Thread[] t = new Mult[n];

		for(int i = 0; i < n; i++){
			t[i] =  new Mult(matrixXY, matrixYZ);
			t[i].start();
		}
		System.out.println("Matriz X x Z:");
		for (int i = 0; i < x ; i++ ) {
			for (int j = 0 ; j < z ; j++ ) {
				System.out.print(finalMatrix[i][j]+ " ");
			}
			System.out.println();
		}
		
	}

	public static Indice getInd(int[][] fMatrix){
		for (int i= 0; i < fMatrix.length; i++ ) {
			for (int j = 0; j < fMatrix[i].length ; j++ ) {
				if ((fMatrix[i][j]) == -1) return new Indice(i,j);
			}
		}
		return new Indice (-1,-1);
	}

	public static class Mult extends Thread{
		int i;
		int j;
		int[][] matrixXY;
		int[][] matrixYZ;

		public Mult (int[][] matrixXY, int[][]matrixYZ){
			
			this.matrixXY = matrixXY;
			this.matrixYZ = matrixYZ;
		}

		public void run(){
			Indice ind = getInd(finalMatrix);
			this.i = ind.i;
			this.j = ind.j;
			while(this.i != -1){
				int result = 0;
				for(int x = 0; x < matrixXY.length; x++){
					for (int z = 0; z < matrixYZ.length ; z++) {
						result = result + (matrixXY[this.i][x]*matrixYZ[z][this.j]);
					}
				}
				finalMatrix[this.i][this.j] = result;
				ind = getInd(finalMatrix);
				this.i = ind.i;
				this.j = ind.j;
			}
		}
	}
}
class Indice {
	int i;
	int j;
	public Indice(int i, int j){
		this.i = i;
		this.j = j;
	}
}