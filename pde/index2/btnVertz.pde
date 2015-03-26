class btnVertdu implements IMenuRunnable {
  String title() { return "vertdu";}
  Boolean saveHistory() { return true; }
  Boolean savePreFxImage() { return true; }
  String logMsg = null;
    String group(){ return "glitch";}

  void run( float xPerc, float yPerc){
    img1 = vertdu(img1,xPerc,yPerc);
  }




PImage vertdu(PImage img, int xp, int yp) { 
  img.loadPixels();
  color last = color(0);
  color dc = img.pixels[0];
  int xw = (int)map(xp,0,100,1,10);
  int yw = 2;//(int)map(yp,0,100,1,10);
  int diff = (int)map(yp,0,100,80,10);
  int[] taken = new int[img.pixels.length];
  for ( int x = 0, w = img.width; x<w; x+= xw ) { 
    for (int y = 0, h = img.height; y<h; y+= yw ) { 
      int pos = x + y * w;
      color c = img.pixels[pos];
      if ( abs(brightness(c) - brightness(last)) > diff ) { 
        dc = c;
      }
      last = c;
      if ( taken[pos] == 0 ) { 
        taken[pos] = 1;
        for (int i = y; i < y+yw; i++) { 
          for (int u = x; u < x+xw; u++) { 
           int p = u + i*w;  
           if ( p > 0 && p < img.pixels.length )  { 
             taken[p] = 1;
             img.pixels[p] = dc;
           }
         }
        }
      } 
    }
  }
  img.updatePixels();
  return img;
}


}
