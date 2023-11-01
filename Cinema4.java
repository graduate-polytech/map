package DB;

public class Cinema4 {
    String Area_2;

    public Cinema4(String Area_2) {
        super();
        this.Area_2 = Area_2;
    }

    @Override
    public String toString() {
        return "Area_2: " + Area_2;
    }

	public Cinema4() {
        this.Area_2 = null;
    }

    public String getArea2() {
        return Area_2;
    }

    public void setArea2(String Area_2) {
        this.Area_2 = Area_2;
    }
}
