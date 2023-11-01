package DB;

public class Cinema7 {
    String address;
    public Cinema7(String address) {
        super();
        this.address = address;
    }

    @Override
    public String toString() {
        return "address: " + address;
    }

	public Cinema7() {
        this.address = null;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
