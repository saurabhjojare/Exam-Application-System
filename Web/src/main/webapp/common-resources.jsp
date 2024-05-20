   <!-- JSP -->
   
   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <!-- Bootstrap CND -->
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script> -->
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	
	<!-- Toastify CND -->
	
	<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
	
	<!-- Animate CSS -->
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	
	<!-- Favicon -->
	
	<link rel="icon" href="img/favicon.png" type="image/x-icon">
	
	<!-- Java Packages -->
	
	<%@ page import="java.util.List"%>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="java.util.Optional"%>
	<%@ page import="java.util.Collections"%>
	<%@ page import="java.util.stream.Collectors"%>
	
	<%@ page import="com.exam.service.SubjectService"%>
	<%@ page import="com.exam.service.SubjectServiceImpl"%>
	<%@ page import="com.exam.service.ExamService"%>
	<%@ page import="com.exam.service.ExamServiceImpl"%>
	<%@ page import="com.exam.service.AdminService"%>
	<%@ page import="com.exam.service.AdminServiceImpl"%>
	<%@ page import="com.exam.service.QuestionService"%>
	<%@ page import="com.exam.service.QuestionServiceImpl"%>
	
	
	<%@ page import="com.exam.repository.ExamRepository"%>
	<%@ page import="com.exam.repository.ExamRepositoryImpl"%>
	<%@ page import="com.exam.repository.SubjectRepository"%>
	<%@ page import="com.exam.repository.SubjectRepositoryImpl"%>
	<%@ page import="com.exam.repository.QuestionRepository"%>
	<%@ page import="com.exam.repository.QuestionRepositoryImpl"%>
	<%@ page import="com.exam.repository.AdminRepository"%>
	<%@ page import="com.exam.repository.AdminRepositoryImpl"%>
	
	
	<%@ page import="com.exam.model.ExamModel"%>
	<%@ page import="com.exam.model.SubjectModel"%>
	<%@ page import="com.exam.model.ScheduleModel"%>
	<%@ page import="com.exam.model.AdminModel"%>
	<%@ page import="com.exam.model.QuestionModel"%>
	