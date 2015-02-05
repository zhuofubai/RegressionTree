import Jama.Matrix;

/**
 * 
 */

/**
 * @author lenovo
 *
 */
public class RegressionTree {

	/**
	 * 
	 */
	public RegressionTree() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double [][]X0=Matrix.random(15, 3).getArray();
		double[][]Y0=Matrix.random(15, 1).getArray();
		node n=new node();
		int MaxDepth=10;;
		double accuracy=0.01;
		n=RegressionTree.build(X0, Y0, MaxDepth, accuracy);
		System.out.println("END");
	}
	//regression tree build: 
	//input :double [m][n] X, the data set: A m-by-n matrix
	//       double [m][1] Y, the target data: A m-by-1 matrix
	//		 int MaxDepth, the maximum depth of the tree
	//		 int accuracy, the accuracy rate of the tree
	public static node build(double[][] X0, double [][] Y0, int MaxDepth, double accuracy){
		node Node=new node();
		Matrix X=Matrix.constructWithCopy(X0);
		Matrix Y=Matrix.constructWithCopy(Y0);
		int Row=X.getRowDimension();
		int Column=X.getColumnDimension();
		reg r1=new reg();
		reg r2=new reg();
		double mins2=100000;
		double s2=0;
		int index=0;
		for(int i=0;i<X.getRowDimension()-1;i++)
		{	if(i+1<Column|Row-i-1<Column){continue;}
			Matrix X1= X.getMatrix(0, i, 0, Column-1);
			Matrix X2= X.getMatrix(i+1,Row-1, 0,Column-1);
			Matrix Y1= Y.getMatrix(0, i,0,0);
			Matrix Y2= Y.getMatrix(i+1,Row-1,0,0);
			
			r2=MultipleLinearRegression.cmp(X2, Y2);
			r1=MultipleLinearRegression.cmp(X1, Y1);
			s2=r1.s2+r2.s2;
			if(mins2>s2){
				mins2=s2;
				index=i;
			}
		}
		Node.s2=mins2;
		Node.index=index;
		return Node;
	}
	public static void selection(){
		
	}
}
