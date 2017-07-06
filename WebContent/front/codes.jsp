<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.awt.*,java.awt.image.BufferedImage,javax.imageio.ImageIO" %>
     <%
      response.setHeader("Cache-Control", "no-cache");
      int width=90,height=33;
      BufferedImage image=new BufferedImage( width,height,BufferedImage.TYPE_INT_RGB);
      //由bufferdImage对象获得画笔g
      Graphics g=image.getGraphics();
      //画笔填充矩形
      g.setColor(new Color(200,200,200));
      g.fillRect(0, 0, width, height);
      //生成随机数
      Random rd=new Random();
      int rdNum=rd.nextInt(8999)+1000;
      String rdstr=String.valueOf(rdNum);
      //把随机数放入session中
      session.setAttribute("rdStr", rdstr);
      //画笔g画随机数
      g.setColor(Color.BLUE);
      g.setFont(new Font("",Font.PLAIN,25));
      g.drawString(rdstr, 10, 20);//这里的坐标是一个字符的左下角基线   
      //画100个随机点
      g.setColor(Color.green);
      for(int i=0;i<100;i++){
           int x=rd.nextInt(width);
           int y=rd.nextInt(height);
           g.drawOval(x, y, 1, 1);
      }
      //用ImageIO的静态函数write输出图像
      ImageIO.write(image, "JPEG", response.getOutputStream());
      out.clear();
      out=pageContext.popBody(); 
     %>