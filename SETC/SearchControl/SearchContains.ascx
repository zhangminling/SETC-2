<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchContains.ascx.cs" Inherits="SearchControls_SearchContains" %>
<%--<asp:Label ID="Label1" runat="server" Text="" Visible="true"></asp:Label>
<asp:Label ID="Label2" runat="server" Text="" Visible="true"></asp:Label>--%>
<asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
<%@ Register src="Pager.ascx" tagname="Pager" tagprefix="uc1" %>
<uc1:Pager ID="topPager" runat="server" Visible="false" />
<asp:DataList ID="list" runat="server" RepeatColumns="2" CssClass="ProductList" >
  <ItemTemplate>
    <h3 class="ProductTitle">
      <a href="<%# Link.ToArticles(Eval("ID").ToString()) %>">
        <%# HttpUtility.HtmlEncode(Eval("Title").ToString()) %>
      </a>
    </h3>
    <%# HttpUtility.HtmlEncode(Eval("Summary").ToString()) %>
    <p class="DetailSection">
      作者:
      <%# HttpUtility.HtmlEncode(Eval("Author").ToString()) %>
    </p>
    <asp:PlaceHolder ID="attrPlaceHolder" runat="server"></asp:PlaceHolder>
  </ItemTemplate>
</asp:DataList>
<uc1:Pager ID="bottomPager" runat="server" Visible="False" />

