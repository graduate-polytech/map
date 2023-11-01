package DB;

public class Cinema {
    String Area_1;
    String Area_2;
    String name;
    String address;
    String tel;
    String wep;

    public Cinema(String Area_1, String Area_2, String name, String address, String tel, String wep) {
        super();
        this.Area_1 = Area_1;
        this.Area_2 = Area_2;
        this.name = name;
        this.address = address;
        this.tel = tel;
        this.wep = wep;
    }

    @Override
	public String toString() {
		return "Cinema [Area_1=" + Area_1 + ", Area_2=" + Area_2 + ", name=" + name + ", address=" + address + ", tel=" + tel + ", wep=" + wep + "]";
	}

	public Cinema() {
        this.Area_1 = null;
        this.Area_2 = null;
        this.name = null;
        this.address = null;
        this.tel = null;
        this.wep = null;
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
