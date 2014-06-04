<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebForms SM</title>
</head>
<body>
    <div>
        <form runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
                <Scripts>
                    <asp:ScriptReference Path="~/Scripts/jquery-1.6.2.min.js" />
                    <asp:ScriptReference Path="~/bundles/js" />
                </Scripts>
            </asp:ScriptManager>
        </form>
        Hello!
    </div>
</body>
</html>
