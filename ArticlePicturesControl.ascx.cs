using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticlePicturesControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int aid = 0;
        if (int.TryParse(Context.Request["aid"], out aid))
        {
            if (!IsPostBack)
            {
                Image1_SlideShowExtender.ContextKey = Context.Request["aid"];
                PictureService p = new PictureService();
                List<Picture> pics = p.GetPictures(aid);
                if (pics.Count > 0)
                {
                    Image1.ImageUrl = "sqlimage.axd?name=pic&picId=" + pics[0].Id.ToString();
                }
                PicturesListView.DataSource = pics;
                PicturesListView.DataBind();
            }
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        this.Panel1_ModalPopupExtender.Show();
    }
}
