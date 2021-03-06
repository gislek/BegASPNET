﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _ManagePhotoAlbum : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int photoAlbumId = Convert.ToInt32(Request.QueryString.Get("PhotoAlbumId"));

        using (PlanetWroxEntities myEntities = new PlanetWroxEntities())
        {
            string photoAlbumOwner = (from p in myEntities.PhotoAlbums
                                      where p.Id == photoAlbumId
                                      select p.UserName).Single();
            if (User.Identity.Name != photoAlbumOwner && !User.IsInRole("Managers"))
            {
                Response.Redirect("~/");
            }
        }
    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable ListView1_GetData([QueryString("PhotoAlbumId")] int photoAlbumId)
    {
        var myEntities = new PlanetWroxEntities();
        return from p in myEntities.Pictures
               where p.PhotoAlbumId == photoAlbumId
               select p;
    }

    public void ListView1_InsertItem([QueryString("PhotoAlbumId")] int photoAlbumId)
    {
        Picture picture = new Picture();
        TryUpdateModel(picture);

        FileUpload fileUpload1 = (FileUpload)ListView1.InsertItem.FindControl("FileUpload1");
        if (!fileUpload1.HasFile || !fileUpload1.FileName.ToLower().EndsWith(".jpg"))
        {
            CustomValidator customValImage = (CustomValidator)ListView1.InsertItem.FindControl("CustomValImage");
            customValImage.IsValid = false;
            ModelState.AddModelError("Invalid", customValImage.ErrorMessage);
        }

        if(ModelState.IsValid && Page.IsValid)
        {
            using (var myEntities = new PlanetWroxEntities())
            {
                picture.PhotoAlbumId = photoAlbumId;

                string virtualFolder = "~/GigPics/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = Guid.NewGuid().ToString();
                string extension = System.IO.Path.GetExtension(fileUpload1.FileName);

                fileUpload1.SaveAs(System.IO.Path.Combine(physicalFolder, fileName + extension));
                picture.ImageUrl = virtualFolder + fileName + extension;

                myEntities.Pictures.Add(picture);
                myEntities.SaveChanges();
            }
        }
    }

    // The id parameter name should match the DataKeyNames value set on the control
    public void ListView1_DeleteItem(int id)
    {
        using (var myEntities = new PlanetWroxEntities())
        {
            var picture = (from p in myEntities.Pictures
                           where p.Id == id
                           select p).Single();
            myEntities.Pictures.Remove(picture);
            myEntities.SaveChanges();

            string fileName = Server.MapPath(picture.ImageUrl);
            File.Delete(fileName);
        }
    }
}