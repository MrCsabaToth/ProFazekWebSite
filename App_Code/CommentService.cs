using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;

/// <summary>
/// Summary description for CommentService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CommentService : System.Web.Services.WebService {

    public CommentService ()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod]
    public List<Comment> GetComments(int aid)
    {
        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var coms = from c in dtx.Comments
                       where c.ArticleId == aid
                       orderby c.Created
                       select c;
            return coms.ToList();
        }
    }
    
}

