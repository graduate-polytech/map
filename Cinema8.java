package DB;

public class Cinema8 {
    String tel;

    public Cinema8(String tel) {
        super();
        this.tel = tel;
    }

    @Override
	public String toString() {
    	return "tel: " + tel;
	}

	public Cinema8() {
        this.tel = null;
    }
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
