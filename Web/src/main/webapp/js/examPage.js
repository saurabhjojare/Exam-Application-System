
		 $(document).ready(function(){
		     $(document).on("contextmenu",function(e){
		         return false;
		     });
		 });

		$(document).ready(function() {
			$(document).on("copy paste", function(e) {
				e.preventDefault();
			});
		});
	

	
		$(document).ready(function() {
				// Initialize match count
				var matchCount = 0;

				// Listen for form submission
				$("form").submit(function(event) {
					event.preventDefault(); // Prevent default form submission

				    // Loop through each question
					$("div.card").each(function(index) {
						var questionIndex = index + 1;
						var selectedAnswer = $("input[name='question"+ questionIndex+ "']:checked").val(); // Get the selected answer
						var correctAnswer = $("#answer").val(); // Get the correct answer

						// Check if selected answer matches the correct answer
			            if (selectedAnswer === correctAnswer) {
							matchCount++; // Increment match count
						}

						});

					   // Print the number of matches
					   alert("Number of correct answers: "+ matchCount);
							});
						});
	


		$(document)
				.ready(
						function() {
							// Initialize arrays and counters
							var answeredQuestions = [];
							var correctCounter = 0;
							var incorrectCounter = 0;

							// Listen for click events on question options
							$("input[type='radio']").click(function() {
							var selectedOption = $(this).attr("id"); // Get the ID of the selected option
							var questionIndex = selectedOption.split("_")[1]; // Extract the question index from the ID
							var optionIndex = selectedOption.split("_")[0].substr(-1); // Extract the option index from the ID

							// Check if the current question has already been answered
							if (!answeredQuestions.includes(questionIndex)) {
							answeredQuestions.push(questionIndex); // Add the question index to the answered questions array

							var correctAnswer = $("#correctAnswer_"+ questionIndex).val(); // Get the correct answer for the selected question
							var count = answeredQuestions.length; // Get the count of answered questions

						    console.log("Question No : "+ questionIndex+ " \nSelected Option : "+ optionIndex+ " \nAttempted Questions : "+ count+ "\nCorrect Answer : "+ correctAnswer); // Display the count for the specific question and option, along with the correct answer

							if (optionIndex === correctAnswer) {
							correctCounter++; // Increment correct counter
							console.log("Correct Answers : "+ correctCounter);
							} else {
							incorrectCounter++; // Increment incorrect counter
							console.log("Incorrect Answers : "+ incorrectCounter);
							}
							}
							});

							$("#submitButton").click(
									function() {
										$("#attemptedQuestions").text(answeredQuestions.length);
										$("#correctAnswers").text(correctCounter);
										$("#incorrectAnswers").text(incorrectCounter);
										$("#exampleModal").modal("show");
									});

							// Listen for click events on the "Save changes" button
							$("#exampleModal").on('click','.btn-primary',function() {
												// Calculate total attempted questions
												var totalQuestions = answeredQuestions.length;
												// Redirect to result.jsp with URL parameters
												window.location.href = "exam-complete.jsp?correctAnswers="+ correctCounter+ "&incorrectAnswers="+ incorrectCounter + "&totalQuestions="+ totalQuestions + "&attemptedQuestions=" + totalQuestions;
											});
						});
	