using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _NewPhotoAlbum : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void DetailsView1_InsertItem()
    {
        PhotoAlbum photoAlbum = new PhotoAlbum();
        TryUpdateModel(photoAlbum);
        if (ModelState.IsValid)
        {
            using (var myEntities = new PlanetWroxEntities())
            {
                myEntities.PhotoAlbums.Add(photoAlbum);
                photoAlbum.UserName = User.Identity.Name;
                myEntities.SaveChanges();
            }
            Response.Redirect(string.Format("ManagePhotoAlbum?PhotoAlbumId={0}", photoAlbum.Id.ToString()));
        }
    }
}