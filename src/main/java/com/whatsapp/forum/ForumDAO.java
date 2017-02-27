package com.whatsapp.forum;

import java.util.List;

public interface ForumDAO {

	public void addForum(Forum forum);
	
	public Forum getForumById(int id);
	//for users	
	public List<Forum> listForum();

}