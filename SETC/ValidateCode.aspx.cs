using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

public partial class ValidateCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Random rd = new Random(); //创建随机数对象       

            string yanzheng = "";
            for (int i = 0; i < 4; i++)
            {
                yanzheng = yanzheng + rd.Next(10);
            }

            //验证码值存放到Session中用来比较
            Session["ValidateCode"] = yanzheng;

            //以下三句,通过随机找一个现有图象产生一个画布Bitmap
            //string bgFilePath = Server.MapPath(".\\images\\bg_" + new Random().Next(5) + ".jpg");//随机找个图象
            //System.Drawing.Image imgObj = System.Drawing.Image.FromFile(bgFilePath);

            Bitmap newBitmap = new Bitmap(60, 25);//建立位图对象

            Graphics g = Graphics.FromImage(newBitmap);//根据上面创建的位图对象创建绘图面        
            SolidBrush brush = new SolidBrush(Color.Cyan);//设置画笔颜色
            g.FillRectangle(brush, 0, 0, 60, 25);
            brush.Color = Color.Black;
            Font font = new Font("Verdana", 12, FontStyle.Bold);
            g.DrawString(yanzheng, font, brush, 5, 1);

            /*
            //定义一个含10种字体的数组
            String[] ziti ={ "Arial", "Verdana", "Comic Sans MS", "Impact", "Haettenschweiler", "Lucida Sans Unicode", "Garamond", "Courier New", "Book Antiqua", "Arial Narrow" };

            //通过循环,绘制每个字符,
            for (int a = 0; a < yanzheng.Length; a++)
            {
                Font textFont = new Font(ziti[rd.Next(9)], 15, FontStyle.Bold);//字体随机,字号大小30,加粗 
                //每次循环绘制一个字符,设置字体格式,画笔颜色,字符相对画布的X坐标,字符相对画布的Y坐标
                g.DrawString(yanzheng.Substring(a, 1), textFont, brush, 40 + a * 36, 20);
            }
             */

            //保存画的图片到输出流中
            newBitmap.Save(Response.OutputStream, ImageFormat.Gif);
        }

    }
}
