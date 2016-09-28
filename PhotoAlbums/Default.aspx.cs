using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PhotoAlbums_Default : BasePage
{
    PlanetWroxEntities entities = new PlanetWroxEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void photoAlbumList_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListView1.DataBind();
        
    }

    public IEnumerable<PhotoAlbum> PhotoAlbumList_GetData()
    {
        return from p in entities.PhotoAlbums
               orderby p.Id
               select p;
    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable<Picture> ListView1_GetData()
    {
        int photoAlbumId = Convert.ToInt32(photoAlbumList.SelectedValue);
        return from p in entities.Pictures
               where p.PhotoAlbumId == photoAlbumId
               orderby p.Id
               select p;
    }
}