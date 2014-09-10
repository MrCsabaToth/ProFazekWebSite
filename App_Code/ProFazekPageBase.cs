using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Profile;
using System.Threading;
using System.Globalization;

/// <summary>
/// Base class for all Pages on the site for the following reasons:
/// * Theme initialization
/// * Culture/UICulture support/initialization
/// </summary>
public class ProFazekPageBase : System.Web.UI.Page
{
	public ProFazekPageBase()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    protected override void OnPreInit(EventArgs e)
    {
        // the following line is important
//        MasterPage master = this.Master;
        // Page.Master property getter triggers creation of the master page and in turn master page
        // instantiates ITemplates generated for each <asp:Content> section
        // unfortunately, compiler warns us that master is not used

//        if (!IsPostBack)
//        {
            // Theming stuff here
            ProfileCommon pf = HttpContext.Current.Profile as ProfileCommon;
            if (!pf.IsAnonymous)
                Page.Theme = pf.Theme;
            else
                Page.Theme = "Grey";
//        }

        base.OnPreInit(e);
    }

    protected override void InitializeCulture()
    {
//        if (!IsPostBack)
//        {
            ProfileCommon pf = HttpContext.Current.Profile as ProfileCommon;
            string selectedLanguage = "en-US";  // hu-HU
            if (!pf.IsAnonymous)
                selectedLanguage = pf.Language;
            UICulture = selectedLanguage;
            Culture = selectedLanguage;

            Thread.CurrentThread.CurrentCulture =
                CultureInfo.CreateSpecificCulture(selectedLanguage);
            Thread.CurrentThread.CurrentUICulture = new
                CultureInfo(selectedLanguage);
//        }

        base.InitializeCulture();
    }
}
