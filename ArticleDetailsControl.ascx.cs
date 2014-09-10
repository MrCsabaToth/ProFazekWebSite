using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ArticleDetailsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool isUserEditor = Roles.IsUserInRole("editor");
        LinkButton editButton = (LinkButton)ArticleFormView.FindControl("EditButton");
        if (editButton != null)
            editButton.Visible = isUserEditor;
        LinkButton deleteButton = (LinkButton)ArticleFormView.FindControl("DeleteButton");
        if (deleteButton != null)
            deleteButton.Visible = isUserEditor;
        LinkButton newButton = (LinkButton)ArticleFormView.FindControl("NewButton");
        if (newButton != null)
            newButton.Visible = isUserEditor;
    }

    protected void ArticleFormView_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        MembershipUser mu = Membership.GetUser(HttpContext.Current.User.Identity.Name);
        e.Values["AuthorId"] = (Guid)mu.ProviderUserKey;
        e.Values["Created"] = DateTime.Now;
    }
}
