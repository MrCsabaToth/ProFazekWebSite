using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

/// <summary>
/// Summary description for ArticleService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class ArticleService : System.Web.Services.WebService
{
    public ArticleService ()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod]
    public List<Article> GetArticles()
    {
        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var arts = from a in dtx.Articles
                       orderby a.Created descending
                       select a;
            return arts.ToList();
        }
    }

    [WebMethod]
    [ScriptMethod]
    public List<Article> GetArticle(int aid)
    {
        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var arts = from a in dtx.Articles
                       where a.Id == aid
                       select a;
            return arts.ToList();
        }
    }
}

