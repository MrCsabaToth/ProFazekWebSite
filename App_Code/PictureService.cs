using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

/// <summary>
/// Summary description for PictureService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class PictureService : System.Web.Services.WebService {

    public PictureService ()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod]
    public List<Picture> GetPictures(int aid)
    {
        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var pics = from p in dtx.Pictures
                       where p.ArticleId == aid
                       select p;
            return pics.ToList();
        }
    }
}

