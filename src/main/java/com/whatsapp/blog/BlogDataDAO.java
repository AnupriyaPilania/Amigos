package com.whatsapp.blog;

import java.util.List;
public interface BlogDataDAO {

	public void addBlogData(BlogData blogdata);
	
	public BlogData getBlogDataById(int blogdataid);
	
	public List<BlogData> listBlogData();
	
	public void deleteBlogData(BlogData blogdata);

}