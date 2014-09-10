using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ArticleCommentsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int aid = 0;
        if (int.TryParse(Context.Request["aid"], out aid))
        {
            if (!IsPostBack)
            {
                CommentService c = new CommentService();
                CommentsDataList.DataSource = c.GetComments(aid);
                CommentsDataList.DataBind();
            }
        }
    }

    protected string GetUserName(object userId)
    {
        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var user = dtx.aspnet_Users.Single(u => u.UserId == (Guid)userId);
            return user.UserName;
        }
    }

    protected string GetUserSignature(object userId)
    {
        using (DataClassesDataContext dtx = new DataClassesDataContext())
        {
            var up = dtx.aspnet_Users.Single(p => p.UserId == (Guid)userId);
            return Profile.GetProfile(up.UserName).Signature;
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        TextBox commentCtrl = (TextBox)CommentsLoginView.FindControl("CommentTextBox");
        if (commentCtrl != null && commentCtrl.Text.Length > 0)
        {
            using (DataClassesDataContext dtx = new DataClassesDataContext())
            {
                int aid = 0;
                MembershipUser mu = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                if (int.TryParse(Context.Request["aid"], out aid))
                {
                    var comment = new Comment()
                    {
                        ArticleId = aid,
                        UserId = (Guid)mu.ProviderUserKey,
                        Body = commentCtrl.Text,
                        Created = System.DateTime.Now
                    };
                    dtx.Comments.InsertOnSubmit(comment);
                    dtx.SubmitChanges();

                    CommentService c = new CommentService();
                    CommentsDataList.DataSource = c.GetComments(aid);
                    CommentsDataList.DataBind();
                }
                commentCtrl.Text = "";
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        AjaxControlToolkit.ModalPopupExtender mpe = (AjaxControlToolkit.ModalPopupExtender)CommentsLoginView.FindControl("Panel2_ModalPopupExtender");
        if (mpe != null)
        {
            LinkButton lb = (LinkButton)sender;
            Label nl = (Label)CommentsLoginView.FindControl("UNameLabel");
            if (nl != null)
                nl.Text = lb.Text;
            Label sl = (Label)CommentsLoginView.FindControl("USignatureLabel");
            if (sl != null)
                sl.Text = Profile.GetProfile(lb.Text).Signature;
            Label al = (Label)CommentsLoginView.FindControl("UActiveLabel");
            if (al != null)
            {
                DateTime act = Profile.GetProfile(lb.Text).LastActivityDate;
                al.Text = act.ToLongDateString() + " " + act.ToLongTimeString();
            }
            mpe.Show();
        }
    }
}
