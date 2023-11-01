package DB;

public class Cinema6 {
    float location_y; // 변경: Float 대신에 float 사용

    public Cinema6(float location_y) {
        super();
        this.location_y = location_y; // 변수명 수정: y -> location_y
    }

    @Override
    public String toString() {
        return "location_y: " + location_y;
    }

	public Cinema6() {
        this.location_y = 0.0f; // 기본값으로 초기화
    }

    public float getLocation_y() { // 메서드명 수정: getlocation_y -> getLocation_y
        return location_y;
    }
    public void setLocation_y(float y) { // 메서드명 수정: setlocation_y -> setLocation_y
        this.location_y = y;
    }
}
