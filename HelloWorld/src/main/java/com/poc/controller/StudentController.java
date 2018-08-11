package com.poc.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.poc.entity.Student;
import com.poc.service.StudentService;
 

 
@Controller
@RequestMapping(value = "/student")
public class StudentController {
 
	public int length;
    public byte[] fileBytes;
    public String name;
    public String type;
	@Autowired
	StudentService studentService;
 
	@RequestMapping("/showFormForAdd")
	public String showAddForm(Model model) {
		model.addAttribute("student", new Student());
		return "AddStudent";
	}
 
	@RequestMapping("/saveProcess")
	public String saveStudentObj(@ModelAttribute("student") Student studentObj) {
		studentService.saveStudentObj(studentObj);
		return "redirect:/student/list";
	}
	
	@RequestMapping("/list")
	public String listOfStudents(Model model) {
		model.addAttribute("studentsList", studentService.getAllStudents());
		return "StudentList";
	}
	
	@RequestMapping("/displayUpdateForm")
	public String showUpdateForm(@RequestParam("studentId") int theId, Model model) {
		model.addAttribute("student", studentService.getStudentObj(theId));
		return "UpdateStudent";
	}
 
	@RequestMapping("/displayDeleteForm")
	public String deleteStudentObj(@RequestParam("studentId") int theId, Model model) {
		studentService.removeStudentObj(theId);
		return "redirect:/student/list";
	}
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public @ResponseBody
	String uploadFileHandler(MultipartHttpServletRequest request, HttpServletResponse response) {

		String name = "untitled";
		Iterator<String> itr =  request.getFileNames();
		 
	     MultipartFile file = request.getFile(itr.next());
		if (!file.isEmpty()) {
			try {
				name = file.getOriginalFilename();
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				String absoluteFileName = dir.getAbsolutePath()
						+ File.separator + name;
				File serverFile = new File(absoluteFileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("Server File Location="
						+ serverFile.getAbsolutePath());
				
				 type = file.getContentType();
		         length = bytes.length;
		         fileBytes = bytes;

		         return "<img src='http://localhost:8080/HelloWorld/student/get/"+Calendar.getInstance().getTimeInMillis()+"' />";
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		} else {
			return "You failed to upload " + name
					+ " because the file was empty.";
		}
	}
	
	@RequestMapping(value = "/get/{value}", method = RequestMethod.GET)
	  public void get(HttpServletResponse response,@PathVariable String value){
	        try {
	 
	            response.setContentType(type);
	            response.setContentLength(length);
	            FileCopyUtils.copy(fileBytes, response.getOutputStream());
	 
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	  }

}
