using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProfileControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Profile.Theme == "Grey")
                DropDownList1.SelectedIndex = 0;
            else if (Profile.Theme == "Green")
                DropDownList1.SelectedIndex = 1;
            else    // Blue
                DropDownList1.SelectedIndex = 2;
            TextBox1.Text = Profile.Signature;
            DropDownList3.SelectedValue = Profile.Language;
            if (Profile.Language == "hu-HU")
                DropDownList3.SelectedIndex = 0;
            else if (Profile.Language == "en-US")
                DropDownList3.SelectedIndex = 2;
            else
                DropDownList3.SelectedIndex = 1;    // Auto
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
            Profile.Theme = "Grey";
        else if (DropDownList1.SelectedIndex == 1)
            Profile.Theme = "Green";
        else
            Profile.Theme = "Blue";
        Profile.Save();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Profile.Signature = TextBox1.Text;
        Profile.Save();
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex == 0)
            Profile.Language = "hu-HU";
        else if (DropDownList3.SelectedIndex == 1)
            Profile.Language = Request.UserLanguages[0];
        else
            Profile.Language = "en-US";
        Profile.Save();
    }
}
