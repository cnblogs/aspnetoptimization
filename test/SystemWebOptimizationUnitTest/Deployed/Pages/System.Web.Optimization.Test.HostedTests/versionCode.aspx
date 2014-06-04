<%@ Page Language="C#" %>
<%@ Import Namespace="System.Web.Optimization" %>
<% Response.Write(BundleTable.Bundles.ResolveBundleUrl(Request.QueryString["url"], true)); %>
