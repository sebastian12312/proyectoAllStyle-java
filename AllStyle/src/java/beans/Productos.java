package beans;

public class Productos {
    String IdProducto;
    String NombreP;
    String DescP;
    int Stock;
    float Precio;
    String Genero;
    String Categoria;
    String Imagen;

    public Productos() {
    }

    public Productos(String IdProducto, String NombreP, String DescP, int Stock, float Precio, String Genero, String Categoria, String Imagen) {
        this.IdProducto = IdProducto;
        this.NombreP = NombreP;
        this.DescP = DescP;
        this.Stock = Stock;
        this.Precio = Precio;
        this.Genero = Genero;
        this.Categoria = Categoria;
        this.Imagen = Imagen;
    }

    public String getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(String IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getNombreP() {
        return NombreP;
    }

    public void setNombreP(String NombreP) {
        this.NombreP = NombreP;
    }

    public String getDescP() {
        return DescP;
    }

    public void setDescP(String DescP) {
        this.DescP = DescP;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
    
    
    
}
