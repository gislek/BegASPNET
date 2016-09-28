using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PhotoAlbums_PhotoView : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int pictureId = Convert.ToInt32(Request.QueryString.Get("Id"));
        using (PlanetWroxEntities entities = new PlanetWroxEntities())
        {
            string imageUrl = (from picture in entities.Pictures
                               where picture.Id == pictureId
                               select picture).Single().ImageUrl;
            Image1.ImageUrl = imageUrl;
        }
    }
}