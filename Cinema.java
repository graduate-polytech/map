package DB;

public class Cinema {
    String Area_1;
    String Area_2;
    String name;
    float location_x; // 변경: Float 대신에 float 사용
    float location_y; // 변경: Float 대신에 float 사용
    String address;
    String tel;
    String wep;

    public Cinema(String Area_1, String Area_2, String name, float location_x, float location_y, String address, String tel, String wep) {
        super();
        this.Area_1 = Area_1;
        this.Area_2 = Area_2;
        this.name = name;
        this.location_x = location_x; // 변수명 수정: x -> location_x
        this.location_y = location_y; // 변수명 수정: y -> location_y
        this.address = address;
        this.tel = tel;
        this.wep = wep;
    }

    public Cinema() {
        this.Area_1 = null;
        this.Area_2 = null;
        this.name = null;
        this.location_x = 0.0f; // 기본값으로 초기화
        this.location_y = 0.0f; // 기본값으로 초기화
        this.address = null;
        this.tel = null;
        this.wep = null;
    }

    public float getlocation_x() { // 메서드명 수정: getlocation_x -> getLocation_x
        return location_x;
    }
    public void setlocation_x(float x) { // 메서드명 수정: setlocation_x -> setLocation_x
        this.location_x = x;
    }
    public float getlocation_y() { // 메서드명 수정: getlocation_y -> getLocation_y
        return location_y;
    }
    public void setlocation_y(float y) { // 메서드명 수정: setlocation_y -> setLocation_y
        this.location_y = y;
    }
    
    public String getArea1() {
        return Area_1;
    }

    public void setArea1(String Area_1) {
        this.Area_1 = Area_1;
    }

    public String getArea2() {
        return Area_2;
    }

    public void setArea2(String Area_2) {
        this.Area_2 = Area_2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getWep() {
        return wep;
    }

    public void setWep(String wep) {
        this.wep = wep;
    }
}
