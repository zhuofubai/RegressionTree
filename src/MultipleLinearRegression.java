import Jama.Matrix;

public class MultipleLinearRegression {

    public static void main(Matrix X, Matrix y) { 

        // generate random n-by-p matrix
       // int n = Integer.parseInt(args[0]);
        //int p = Integer.parseInt(args[1]);
        //double [][]X1={{1,2,3},
        		//	   {2,3,4},
        		//		{1,3,4}};
        //double [][]y1={{1},{2},{3}};
        int n=X.getColumnDimension();
        int p=X.getRowDimension();
       // Matrix X = Matrix.random(n, p);
      //  Matrix y = Matrix.random(n, 1);
       // Matrix X = Matrix.constructWithCopy(X1);
        //Matrix y = Matrix.constructWithCopy(y1);
        // solve least squares problem using Jama
        Matrix beta = X.solve(y);
        Matrix residuals = X.times(beta).minus(y);

        // print results
        System.out.println("X = ");
        X.print(9, 4);
        System.out.println("y = ");
        y.print(9, 4);
        System.out.println("beta = ");
        beta.print(9, 4);
        System.out.println("X beta - y = ");
        residuals.print(9, 4);

        // error variance
        double s2 = residuals.norm2() / (n - p - 1);
        System.out.println("error variance = " + s2);

    }

    public static reg cmp(Matrix X, Matrix y){
    	reg r=new reg();
    	//Matrix X = Matrix.constructWithCopy(X1);
       // Matrix y = Matrix.constructWithCopy(y1);
        // solve least squares problem using Jama
    	int n=X.getColumnDimension();
        int p=X.getRowDimension();
        Matrix beta = X.solve(y);
        Matrix residuals = X.times(beta).minus(y);
        double s2 = residuals.norm2() / (n - p - 1);
        r.beta=beta;
        r.residuals=residuals;
        r.s2=s2;
        return r;
    }
}

