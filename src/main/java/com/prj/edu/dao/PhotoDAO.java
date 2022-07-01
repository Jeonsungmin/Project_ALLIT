package com.prj.edu.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.prj.edu.dto.PhotoDTO;

public interface PhotoDAO {



	//String upload(String photo_original, String photo_copy, String photo_category);

	//void fileWrite(String photo_original, String photo_copy, int photo_pr_num, String photo_category);

	//void uploadPhotos(String photo_original, String photo_copy);

	void photoSave(String photo_original, String photo_copy, int recruit_idx);

	ArrayList<PhotoDTO> photoList(String idx);

}
