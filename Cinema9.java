package DB;

public class Cinema9 {
    String wep;

    public Cinema9(String wep) {
        super();
        this.wep = wep;
    }

    @Override
	public String toString() {
    	return "wep: " + wep;
	}

	public Cinema9() {
        this.wep = null;
    }
    public String getWep() {
        return wep;
    }

    public void setWep(String wep) {
        this.wep = wep;
    }
}
