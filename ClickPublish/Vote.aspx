<%@ Page Title="Vote" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="ClickPublish._Default" validateRequest="false" EnableEventValidation="false"%>

<script runat="server">
    void ClientClick(Object sender, FormViewUpdatedEventArgs e)
    {

        //Response.Cookies["Authenticated"].Value = "false";
        TextBox tx1 = (TextBox)FormView1.FindControl("fnameTextBox");
        TextBox tx2 = (TextBox)FormView1.FindControl("lnameTextBox");


        searchUrl = "~/Search.aspx?" + "fname=" + tx1.Text + "&lname=" + tx2.Text;

        Response.Redirect(searchUrl);
    }
</script>


<asp:Content runat="server" ID="FeaturedContent" ViewStateMode="Disabled" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Voting Page&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    Cast your vote</h1>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <p style="height: 345px">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="New2" DefaultMode="Edit" EmptyDataText="Cast your vote" OnLoad="Page_Load" OnItemUpdated="ClientClick" >
            <EditItemTemplate>
                <b>Candidate's First name:</b>
                <asp:TextBox ID="fnameTextBox" runat="server"  Text='<%# Bind("fname") %>' />
                <br />
                <b>Candidate's Last Name:</b>
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                <br /><br />
                <b><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Vote Here"/></b>
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
            </EditItemTemplate>
            <InsertItemTemplate>
                fname:
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                fname:
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                lname:
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="New2" runat="server" ConnectionString="<%$ ConnectionStrings:NewDbConnectionString %>" SelectCommand="SELECT [fname], [lname] FROM [Table]" UpdateCommand="IF EXISTS (SELECT * FROM [Table] WHERE fname = @fname AND lname = @lname) BEGIN UPDATE [Table] SET count = count + 1 WHERE (lname = @lname) AND (fname = @fname) END ELSE BEGIN INSERT INTO [Table] (fname, lname, count) VALUES (@fname, @lname, 1) END">
            <UpdateParameters>
                <asp:Parameter Name="fname" />
                <asp:Parameter Name="lname" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p style="height: 345px">
        &nbsp;</p>
</asp:Content>
