package com.whatsapp;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.whatsapp.forum.Forum;
import com.whatsapp.forum.ForumDAO;
import com.whatsapp.forumcomment.ForumComment;
import com.whatsapp.forumcomment.ForumCommentDAO;
import com.whatsapp.user.User;
import com.whatsapp.user.UserDAO;

@RestController
	public class RESTForumController {

		@Autowired
		UserDAO userdao;
		
		@Autowired
		ForumDAO forumdao;
		
		@Autowired
		ForumCommentDAO forucommentmdao;
		
		@RequestMapping( value = "/postforum" , method = RequestMethod.POST)
		public ResponseEntity<String> postForum(@RequestBody JSONObject data, Principal p){
		
			System.out.println(data.get("ForumTitle").toString());
			
			User user = userdao.getUserByEmail(p.getName());
			
			Date date = new Date();
			Forum forum = new Forum();
			
			forum.setTitle(data.get("ForumTitle").toString());
			forum.setUserId(user);
			forum.setForumdate(date);
			
			forumdao.addForum(forum);
			
			JSONObject json = new JSONObject();

			json.put("status", "Forum is posted");
			System.out.println(json.toString());
			
			
			return new ResponseEntity<String>(json.toString(),HttpStatus.OK);
		}
		
		@RequestMapping( value = "/getforums" , method = RequestMethod.GET)
		public ResponseEntity<List<Forum>> listForum(){
			
			List<Forum> list = forumdao.listForum();
			
			return new ResponseEntity<List<Forum>>(list,HttpStatus.OK);
		}
		
		@RequestMapping( value = "/postcomment" , method = RequestMethod.POST)
		public void postComment(@RequestBody JSONObject data, Principal p){
			
			System.out.println(data);
			
			User user = userdao.getUserByEmail(p.getName());
			Forum forum = forumdao.getForumById(Integer.parseInt(data.get("ForumID").toString()));
			Date date = new Date();
			/*
			System.out.println(data.get("ForumID").toString());
			System.out.println(data.get("Comment").toString());*/
			
			ForumComment forumComment = new ForumComment();
			forumComment.setForumcomment(data.get("Comment").toString());
			forumComment.setUserId(user);
			forumComment.setForumId(forum);
			forumComment.setCommentDate(date);
			
			forucommentmdao.addForumComment(forumComment);
			
		}
		
		@RequestMapping( value = "/listforumcomments" , method = RequestMethod.GET)
			public ResponseEntity<List<ForumComment>> listForumComments(){
				
				List<ForumComment> list = forucommentmdao.listForumComment();
				
				return new ResponseEntity<List<ForumComment>>(list, HttpStatus.OK);
			
			}
		
			
	}
	
	