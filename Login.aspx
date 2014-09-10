<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register src="ProfileControl.ascx" tagname="ProfileControl" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainCopy" Runat="Server">
    <div class="container">
        <div id="contactForm">
            <fieldset style="width: 300px;">
                <asp:Login ID="Login1" runat="server" meta:resourcekey="Login1Resource1">
                </asp:Login>
            </fieldset>
            <fieldset style="width: 300px;">
                <asp:Label ID="Label1" runat="server" Text="Not a member? Register here:" 
                        meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                        onfinishbuttonclick="CreateUserWizard1_FinishButtonClick" 
                        meta:resourcekey="CreateUserWizard1Resource1">
                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" 
                            meta:resourcekey="CreateUserWizardStepResource1" />
                        <asp:WizardStep ID="WizardStep1" runat="server" Title="PersonalData" 
                            meta:resourcekey="WizardStepResource2">
                            <uc1:ProfileControl ID="ProfileControl1" runat="server" />
                        </asp:WizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" 
                            meta:resourcekey="CompleteWizardStepResource1" />
                    </WizardSteps>
                </asp:CreateUserWizard>
            </fieldset>
        </div>
    </div>
</asp:Content>

