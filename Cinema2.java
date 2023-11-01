package DB;

public class Cinema2 {
    String name;

    public Cinema2(String name) {
        super();
        this.name = name;
    }

    @Override
    public String toString() {
        return "name: " + name;
    }

	public Cinema2() {
        this.name = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
