    import processing.serial.*; 
     
    Serial myPort; 
     
    int x;   
    int y;   
    int b;   
    PFont f;
    String portName;
     
    void setup()
    {
      size(512, 512); 
     
          
    myPort = new Serial(this, "COM21", 9600);
    myPort.bufferUntil('\n');
 
    f = createFont("Consolas", 20, true); 
    textFont(f, 20); 
    
  }
     
     
     
    
    void draw()
    {
      fill(0); 
      clear(); 
     
      fill(255); 
     
      if (b == 1) 
      {
        fill(255,0,0);
        ellipse(x/2, y/2, 50, 50);
        fill(255);
      } else
      {
        ellipse(x/2, y/2, 25, 25);
       
      }
     
        text("AnalogX="+(1023-x)+" AnalogY="+(1023-y),10,20);
    }
 
     
void serialEvent(Serial port)
{
  String input = port.readStringUntil('\n');
 
  if (input != null)
   {
    String[] q = splitTokens(input);
    x = parseInt(q[0]);
    y = parseInt(q[1]);
    b = parseInt(q[2]);
  }
}