package com.whatsapp;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.whatsapp.blog.Blog;
import com.whatsapp.blog.BlogDAO;
import com.whatsapp.blog.BlogData;
import com.whatsapp.blog.BlogDataDAO;
import com.whatsapp.user.User;
import com.whatsapp.user.UserDAO;

@RestController
public class RESTBlogController {

	@Autowired
	UserDAO userdao;

	@Autowired
	BlogDAO blogdao;
	
	@Autowired
	BlogDataDAO blogdatadao;


	@RequestMapping(value = "postblog" , method = RequestMethod.POST)
	public ResponseEntity<String> postBlog(@RequestBody JSONObject data, Principal p) {
		System.out.println(data);

		User user = userdao.getUserByEmail(p.getName());

		/*
		 * DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		 */
		Date date = new Date();
		System.out.println(date);

		Blog blog = new Blog();

		blog.setTitle(data.get("BlogTitle").toString());
		blog.setDescription(data.get("BlogDesc").toString());
		blog.setBlogdate(date);

		blog.setUserId(user);

		blogdao.addBlog(blog);

		JSONObject json = new JSONObject();

		json.put("status", "BLOG SEND FOR APPROVAL");
		System.out.println(json.toString());

		return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);
	}

	@RequestMapping(value = "admin/allblogs" , method = RequestMethod.GET)
	public ResponseEntity<List<Blog>> allBlogs() {

		List<Blog> list = blogdao.listAllBlogs();

		return new ResponseEntity<List<Blog>>(list, HttpStatus.OK);

	}

	@RequestMapping(value = "/publishblog" , method = RequestMethod.POST)
	public ResponseEntity<String> publishBlog(@RequestBody String inputdata) {
		System.out.println(inputdata);

		int blogid = Integer.parseInt(inputdata);

		System.out.println(blogid);

		Blog blog = blogdao.getBlogById(blogid);

		blog.setPosted(true);

		// update blog
		blogdao.addBlog(blog);

		JSONObject json = new JSONObject();

		json.put("status", "BLOG PUBLISHED");
		System.out.println(json.toString());

		return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);

	}
	
	@RequestMapping(value = "/unpublishblog" , method = RequestMethod.POST)
	public ResponseEntity<String> unPublishBlog(@RequestBody String inputdata) {
		System.out.println(inputdata);

		int blogid = Integer.parseInt(inputdata);

		System.out.println(blogid);

		Blog blog = blogdao.getBlogById(blogid);

		blog.setPosted(false);

		// update blog
		blogdao.addBlog(blog);

		JSONObject json = new JSONObject();

		json.put("status", "BLOG UNPUBLISHED");
		System.out.println(json.toString());

		return new ResponseEntity<String>(json.toString(), HttpStatus.CREATED);

	}
	@RequestMapping(value = "/blogs" , method = RequestMethod.GET)
	public ResponseEntity<List<Blog>> blogs() {

		List<Blog> list = blogdao.listBlogs();

		return new ResponseEntity<List<Blog>>(list, HttpStatus.OK);

	}
	@RequestMapping(value = "/addblogdata" , method = RequestMethod.POST)
	public void addBlogData(@RequestBody JSONObject data, Principal p){
		
		System.out.println(data);
		BlogData blogData = new BlogData();
		blogData.setBlogData(data.get("BlogData").toString());
		Blog b = new Blog();
		String selectedBlogId = data.get("BlogID").toString();
		b.setBlogId(Integer.parseInt(selectedBlogId));
		blogData.setBlogId(b);
		
		blogdatadao.addBlogData(blogData);
	}
	
	@RequestMapping(value = "/getblogdata" , method = RequestMethod.GET)
	public ResponseEntity<List<BlogData>> getBlogData(){
		
		List<BlogData> list = blogdatadao.listBlogData();
		return new ResponseEntity<List<BlogData>>(list,HttpStatus.OK);
	}
	@RequestMapping(value = "/deleteblogdata/{blogdataid}" , method = RequestMethod.GET)
	public void deleteBlogData(@PathVariable("blogdataid") int blogdataid){
		System.out.println("Blog Id:"+blogdataid);
		BlogData blogdata = blogdatadao.getBlogDataById(blogdataid);
		
		blogdatadao.deleteBlogData(blogdata);
			
	}
	@RequestMapping(value = "/updateblogdata" , method = RequestMethod.POST)
	public void updateBlogData(@RequestBody JSONObject data, Principal p){
		
		System.out.println(data);
		
		BlogData blogData = blogdatadao.getBlogDataById(Integer.parseInt(data.get("BlogID").toString()));
			
		blogData.setBlogData(data.get("UpdatedBlogData").toString());		
		blogdatadao.addBlogData(blogData);
	}
	

}