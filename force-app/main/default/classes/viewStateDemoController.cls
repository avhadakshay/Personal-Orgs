public class viewStateDemoController {

    public Integer a {get; set;}
    private Integer b {get; set;}
    transient Integer c {get; set;}
    private Integer d {get; set;}
    
    public String message {get;set;}
    public viewStateDemoController () {
        a = 20;
        b = 30;
        c = 40;
        d = 50;
    }
    
    public Pagereference changeData() {
        if (a == 20) {
            a = 21;
        }
        if (b == 30) {
            b = 31;
        }
        if (c == 30) {
            c = 41;
        }
        if (d == 50) {
            b = 51;
        }
    	
        message = 'Values after button click';
        return null;
    }
    
}