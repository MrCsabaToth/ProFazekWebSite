using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for SlideService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SlideShowService : System.Web.Services.WebService
{
    public SlideShowService()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod]
    public AjaxControlToolkit.Slide[] GetSlides(String contextKey)
    {
        List<AjaxControlToolkit.Slide> slides = new List<AjaxControlToolkit.Slide>();
        if (String.IsNullOrEmpty(contextKey))
            contextKey = "2";

        int artIndex = -1;
        if (int.TryParse(contextKey, out artIndex))
        {
            DataClassesDataContext dtx = new DataClassesDataContext();
            var pics = from p in dtx.Pictures
                       where p.ArticleId == artIndex
                       select new
                       {
                           Id = p.Id,
                           Title = p.Title
                       };

            foreach (var p in pics)
            {
                slides.Add(new AjaxControlToolkit.Slide("sqlimage.axd?name=pic&picId=" + p.Id, p.Title, ""));
            }
        }

        return slides.ToArray();
    }
}

