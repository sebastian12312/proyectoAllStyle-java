package beans;

public class Boletas {
    private String IDBoleta;
    private String DNI;
    private double Impuesto;
    private String Fechac;
    private String Estado;
    
    public Boletas() {
    }

    public Boletas(String IDBoleta, String DNI, double Impuesto, String Fechac, String Estado) {
        this.IDBoleta = IDBoleta;
        this.DNI = DNI;
        this.Impuesto = Impuesto;
        this.Fechac = Fechac;
        this.Estado = Estado;
    }

    public Boletas(String IDBoleta, String DNI, String Fechac, String Estado) {
        this.IDBoleta = IDBoleta;
        this.DNI = DNI;
        this.Fechac = Fechac;
        this.Estado = Estado;
    }

    public String getIDBoleta() {
        return IDBoleta;
    }

    public void setIDBoleta(String IDBoleta) {
        this.IDBoleta = IDBoleta;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public double getImpuesto() {
        return Impuesto;
    }

    public void setImpuesto(double Impuesto) {
        this.Impuesto = Impuesto;
    }

    public String getFechac() {
        return Fechac;
    }

    public void setFechac(String Fechac) {
        this.Fechac = Fechac;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
    
}
