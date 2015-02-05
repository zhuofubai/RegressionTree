import Jama.Matrix;

/**
 * 
 */

/**
 * @author lenovo
 *
 */
public class test {
	
	/**
	 * 
	 */
	public test() {
		// TODO Auto-generated constructor stub
	}
	public int cmp(int i){
		return i+1;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		test s= new test();
		 double [][]X1={{1,2,3},
		   {4,5,6},
				{7,8,11},
		   	{2,3,10}};
		 double [][]y1={{1},{2},{3},{6}};
		 double [][]X0={{1.3, 2.0, 3.5, 1},
			   	   {4.2, 5.1, 6.6, 1},
				   {7.6, 5.2, 11.3,1},
			   	   {2.3, 1.1, 3.4, 1}};
	double[][]Y0={{3.3},{4.3},{2.3},{7.1}};
		 Matrix X=Matrix.constructWithCopy(X1);
		 Matrix y=Matrix.constructWithCopy(y1);
		 Matrix X3=Matrix.constructWithCopy(X0);
		 Matrix y3=Matrix.constructWithCopy(Y0);
		 reg r=MultipleLinearRegression.cmp(X, y);
		 reg r2=MultipleLinearRegression.cmp(X3, y3);
		 double [][]result=r.beta.getArray();
		 //Matrix X=Matrix.constructWithCopy(X1);
		 int []i={0,2};
		 int []j={1,2};
		 Matrix X2=X.getMatrix(0, 1, j);
 		 System.out.println("end "+r.beta.getColumnDimension()+" "+r.beta.getRowDimension());
	}

}
