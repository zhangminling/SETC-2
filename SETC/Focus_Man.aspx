<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Focus_Man.aspx.cs" Inherits="Focus_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="CurrentPosition">��ǰλ�ã�<a href="#">����ͼ����</a></div>
<center><h1>����ͼ����</h1></center>
<p>&nbsp;</p>
    <p>
        ���ͼƬ�Ĵ�СΪ1000*300���أ������ϴ���ͼƬ��ʽΪ��<asp:Label ID="ExtensionLabel" runat="server" Text="Label"></asp:Label>��
    </p>
    <p>
        <asp:Label ID="ResultLabel" runat="server" Text="Label"></asp:Label>
    </p>
<div>
<p style="text-align:center;">

    <asp:FileUpload ID="FileUpload1" runat="server" Width="600px" />

&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="�ϴ�ͼƬ" />
</p>

<p style="text-align:center;">
    <asp:Image ID="Image1" Width="800" Height="240" runat="server" AlternateText="" />
</p>
<p>&nbsp;</p>
<p style="text-align:center;">
���ӣ�<asp:TextBox ID="LinkURLTextBox" runat="server" Width="500"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
����<asp:TextBox ID="OrdersTextBox" runat="server" Width="30"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
��ʾ��<asp:CheckBox ID="ValidCheckBox" runat="server" Text="��ʾ" />&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="ID_Label" runat="server" Visible="false" Text="" />
<asp:Button ID="Button2" runat="server" Text="ȷ��" onclick="Button2_Click" />
</p>

<asp:GridView ID="GridView1" runat="server" Width="98%" AutoGenerateColumns="False" DataKeyNames="ID" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        RowStyle-HorizontalAlign="Center" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowcommand="GridView1_RowCommand">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:BoundField DataField="Orders" HeaderText="����" ItemStyle-Width="30" 
            Visible="false" >
<ItemStyle Width="30px"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="��" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="30px" HorizontalAlign="center"/>
            <HeaderStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="����ͼ" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <img src='<%# Eval("PhotoSrc") %>' alt='<%# Eval("LinkURL") %>' width="500" height="150" />
            </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:TemplateField>        
        <asp:TemplateField HeaderText="����" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:TextBox ID="OrdersTB" runat="server" Text='<%# Eval("Orders") %>' Width="30" BorderWidth="1"></asp:TextBox>
            </ItemTemplate>
            <ItemStyle Width="60px" HorizontalAlign="center"/>
            <HeaderStyle Width="60px" />
        </asp:TemplateField>
        
        <asp:CheckBoxField DataField="Valid" HeaderText="��ʾ"  />
        <asp:ButtonField ButtonType="Button" CommandName="Edit2" HeaderText="�༭" ShowHeader="True" Text="�༭" />
            
        <asp:ButtonField ButtonType="Button" CommandName="Del2" HeaderText="ɾ��" 
            ShowHeader="True" Text="ɾ��" />
        
        
        
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" HorizontalAlign="Center" Font-Bold="True" Height="32" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>

</div>
<p>&nbsp;</p>
</asp:Content>

