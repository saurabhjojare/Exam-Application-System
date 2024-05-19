$(document).ready(function() {
    var correctCounter = 0;
    var prevSelectedOptions = {};
    var prevSelectedCorrect = {};
    var questionCount = config.questionCount;
    var marksPerQuestion = config.marksPerQuestion;
    var passingMarks = config.passingMarks;

    $("input[type='radio']").click(function() {
        var selectedOption = $(this).val();
        var questionIndex = $(this).attr("name").replace("question", "");
        var prevSelectedOption = prevSelectedOptions[questionIndex];
        var prevSelectedIsCorrect = prevSelectedCorrect[questionIndex];
        var correctAnswer = $("#correctAnswer_" + questionIndex).val();

        if (selectedOption === correctAnswer && (!prevSelectedOption || !prevSelectedIsCorrect)) {
            correctCounter++;
        } else if (selectedOption !== correctAnswer && (prevSelectedOption && prevSelectedIsCorrect)) {
            correctCounter--;
        }

        prevSelectedOptions[questionIndex] = selectedOption;
        prevSelectedCorrect[questionIndex] = (selectedOption === correctAnswer);

        $("#correctAnswerSpan").text("Correct Answer: " + correctAnswer);
        $("#correctCount").text("Correct Answers: " + correctCounter);
        var percentage = (correctCounter / questionCount) * 100;
        console.log("Percentage:", percentage);
        $("#percentage").text(" | Percentage: " + percentage.toFixed(2) + "%");

        var marksObtained = correctCounter * marksPerQuestion;

        if (marksObtained >= passingMarks) {
            $("#passOrFail").text("Pass");
        } else {
            $("#passOrFail").text("Fail");
        }
    });

    $("#submitButton").click(function() {
        var percentageText = $("#percentage").text().split(": ")[1].replace("%", "");
        var passOrFailText = $("#passOrFail").text();
        $("#hiddenPercentage").val(percentageText);
        $("#hiddenPassOrFail").val(passOrFailText);
        $("#examForm").submit();
    });
});
