package beans;

public class DetallesBoleta {
    String IDBoleta;
    String IDProducto;
    int Cantidad;
    double Descuento;
    double Importe;

    
    String nombreProducto;
    String imagen;
    double precio;
    
    public DetallesBoleta() {
    }

    public DetallesBoleta(String IDBoleta, String IDProducto, int Cantidad, double Descuento, double Importe) {
        this.IDBoleta = IDBoleta;
        this.IDProducto = IDProducto;
        this.Cantidad = Cantidad;
        this.Descuento = Descuento;
        this.Importe = Importe;
    }

    public DetallesBoleta(String IDBoleta, String nombreProducto, int Cantidad, double precio, String imagen) {
        this.IDBoleta = IDBoleta;
        this.nombreProducto = nombreProducto;
        this.Cantidad = Cantidad;
        this.precio = precio;
        this.imagen = imagen;
    }

    public String getIDBoleta() {
        return IDBoleta;
    }

    public void setIDBoleta(String IDBoleta) {
        this.IDBoleta = IDBoleta;
    }
    
    public String getIDProducto() {
        return IDProducto;
    }

    public void setIDProducto(String IDProducto) {
        this.IDProducto = IDProducto;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getDescuento() {
        return Descuento;
    }

    public void setDescuento(double Descuento) {
        this.Descuento = Descuento;
    }

    public double getImporte() {
        return Importe;
    }

    public void setImporte(double Importe) {
        this.Importe = Importe;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }    
}
