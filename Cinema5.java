package DB;

public class Cinema5 {
    float location_x; // 변경: Float 대신에 float 사용

    public Cinema5(float location_x) {
        super();
        this.location_x = location_x; // 변수명 수정: x -> location_x
    }

    @Override
    public String toString() {
        return "location_x: " + location_x;
    }

	public Cinema5() {
        this.location_x = 0.0f; // 기본값으로 초기화
    }

	public float getLocation_x() { // 수정 필요
	    return location_x;
	}
	public void setLocation_x(float location_x) { // 수정 필요
	    this.location_x = location_x;
	}

}
