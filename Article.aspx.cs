using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;

public partial class Article : ProFazekPageBase
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList dmdl = (DropDownList)LoginView1.FindControl("DisplayModeDropDownList");
            if (dmdl != null)
            {
                foreach (WebPartDisplayMode mod in WebPartManager1.SupportedDisplayModes)
                {
                    dmdl.Items.Add(mod.Name);
                }
            }
            SetChromeTypeForAllWebPart();
        }
    }

    protected void SetChromeTypeForAllWebPart()
    {
        PartChromeType ct = PartChromeType.Default;
        if (!WebPartManager1.DisplayMode.AllowPageDesign)
            ct = PartChromeType.None;
        foreach (WebPart wp in WebPartManager1.WebParts)
        {
            wp.ChromeType = ct;
        }
    }

    protected void DisplayModeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dmdl = (DropDownList)LoginView1.FindControl("DisplayModeDropDownList");
        if (dmdl != null)
        {
            WebPartManager1.DisplayMode =
                WebPartManager1.SupportedDisplayModes[dmdl.SelectedValue];
            SetChromeTypeForAllWebPart();
        }
    }
}
