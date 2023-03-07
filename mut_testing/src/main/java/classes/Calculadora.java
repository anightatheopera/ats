package classes;

public class Calculadora {
    int resultado;
    public Calculadora() {
        resultado = 0;
    }
    public int adiciona(int y) {
        resultado = resultado + y;
        return resultado;
    }
    public int adiciona(int x, int y) {
        resultado = x + y;
        return resultado;
    }
    public int subtrai(int y) {
        resultado = resultado - y;
        return resultado;
    }
    public int subtrai(int x, int y) {
        resultado = x - y;
        return resultado;
    }
    public int ultimoResultado() {
        return resultado;
    }
}