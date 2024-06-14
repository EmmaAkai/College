package Parciales;

public class SumDif {
	private int sum;
	private int dif;
	
	public SumDif(int sum, int dif) {
		this.sum = sum;
		this.dif = dif;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "SumDif [sum=" + sum + ", dif=" + dif + "]";
	}
	
	
}
