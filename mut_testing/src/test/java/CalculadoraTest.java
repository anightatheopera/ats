import classes.Calculadora;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculadoraTest {
    @Test
    public void adiciona01() {
        Calculadora c = new Calculadora();
        int x = c.adiciona(5);
        assertEquals(5,x);
    }
    @Test
    public void adiciona02() {
        Calculadora c = new Calculadora();
        int x = c.adiciona(2,2);
        assertEquals(4,x);
    }
    @Test
    public void subtrai01() {
        Calculadora c = new Calculadora();
        int x = c.subtrai(0,0);
        assertEquals(0,x);
    }

    @Test
    public void adiciona03() {
        Calculadora c = new Calculadora();
        int x = c.adiciona(4,4);
        int y = c.adiciona(2);
        assertEquals(10,y);
    }

    @Test
    public void adiciona_subtrai01(){
        Calculadora c = new Calculadora();
        int x = c.adiciona(4,4);
        int y = c.subtrai(2);
        assertEquals(6,y);
    }

    @Test
    public void adiciona_subtrai02(){
        Calculadora c = new Calculadora();
        int x = c.adiciona(4,4);
        int y = c.subtrai(2);
        int z = c.adiciona(2);
        assertEquals(8,z);
    }

    @Test
    public void ultimo_resultado01(){
        Calculadora c = new Calculadora();
        int x = c.adiciona(4,4);
        int y = c.subtrai(2);
        int z = c.adiciona(2);
        int w = c.ultimoResultado();
        assertEquals(8,w);
    }

    @Test
    public void ultimo_resultado02(){
        Calculadora c = new Calculadora();
        int u = c.ultimoResultado();
        assertEquals(0,u);
    }

    @Test
    public void operacoes05(){
        Calculadora c = new Calculadora();
        int x = c.adiciona(4,0);
        assertEquals(4,x);
    }

    @Test
    public void operacoes06(){
        Calculadora c = new Calculadora();
        int q = c.subtrai(4,4);
        assertEquals(0,q);
    }

    @Test
    public void operacoes07(){
        Calculadora c = new Calculadora();
        int q = c.subtrai(12,4);
        int w = c.subtrai(8);
        assertEquals(0,w);
    }

    @Test
    public void operacoes08(){
        Calculadora c = new Calculadora();
        int q = c.adiciona(12,4);
        int w = c.subtrai(8);
        assertEquals(8,w);
    }

    @Test
    public void operacoes09(){
        Calculadora c = new Calculadora();
        int w = c.subtrai(8);
        int e = c.adiciona(8);
        assertEquals(0,e);
    }

    @Test
    public void operacoes10(){
        Calculadora c = new Calculadora();
        int w = c.subtrai(0);
        assertEquals(0,w);
    }

    @Test
    public void operacoes11(){
        Calculadora c = new Calculadora();
        int w = c.subtrai(-5,5);
        assertEquals(-10,w);
    }

    @Test
    public void operacoes12(){
        Calculadora c = new Calculadora();
        int w = c.subtrai(10,5);
        assertEquals(5,w);
    }

    @Test
    public void operacoes13(){
        Calculadora c = new Calculadora();
        int w = c.subtrai(-5);
        assertEquals(5,w);
    }

    @Test
    public void operacoes14(){
        Calculadora c = new Calculadora();
        int w = c.subtrai(10,5);
        assertEquals(5,w);
    }
}