//document.getElementById("importQuestionsBtn").addEventListener("click", function() {
//    var subjectName = document.getElementById("subjectName").value;
//    var fileInput = document.getElementById("fileInput").files[0];
//    
//    if (subjectName.trim() === "") {
//        alert("Please select a subject");
//        return;
//    }
//    
//    if (!fileInput) {
//        alert("Please select a file to import");
//        return;
//    }
//    
//    var formData = new FormData();
//    formData.append("subjectName", subjectName);
//    formData.append("file", fileInput);
//    
//    var xhr = new XMLHttpRequest();
//    xhr.open("POST", "importQuestion");
//    xhr.onload = function() {
//        if (xhr.status === 200) {
//            // Success, do something if needed
//            window.location.href = "/importSuccess.jsp";
//        } else {
//            alert("Error occurred while importing questions");
//        }
//    };
//    xhr.send(formData);
//});
//
