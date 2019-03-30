import java.io.FileWriter;
import java.io.*;

class Results 
{
  FileWriter fw;
  BufferedWriter bw;
  String path = "C:/Users/ahmed/Desktop/ALL FOLDERS MINE/Processing Programming/PhD_simulation/Calculate diameter/PhD_Simulation";
  
  Results () 
  {
    
  }
  
  void addLine (String m_result)
  {
    try 
        {
          File file = new File (path + "/results.txt");
          if(!file.exists())
            {
              file.createNewFile();    
            }
           FileWriter fw = new FileWriter(file,true);
           BufferedWriter bw = new BufferedWriter(fw);
           PrintWriter pw = new PrintWriter(bw);
           
           pw.write(m_result + "\r\n");
           
           pw.close();
        }
     catch(IOException ioe)
       {
         System.out.println("Exception ");
         ioe.printStackTrace();
       }
  }
  
}
