package DB;

public class Cinema3 {
    String Area_1;

    public Cinema3(String Area_1) {
        super();
        this.Area_1 = Area_1;
    }

    @Override
    public String toString() {
        return "Area_1: " + Area_1;
    }

	public Cinema3() {
        this.Area_1 = null;
    }
    
    public String getArea1() {
        return Area_1;
    }

    public void setArea1(String Area_1) {
        this.Area_1 = Area_1;
    }
}
