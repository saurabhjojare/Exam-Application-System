		  function nextStep() {
	          const currentStep = document.querySelector('.step.active');
	          const nextStep = currentStep.nextElementSibling;
	          if (nextStep && nextStep.classList.contains('step')) {
	              currentStep.classList.remove('active');
	              nextStep.classList.add('active');
	          }
	      }

	      function prevStep() {
	          const currentStep = document.querySelector('.step.active');
	          const prevStep = currentStep.previousElementSibling;
	          if (prevStep && prevStep.classList.contains('step')) {
	              currentStep.classList.remove('active');
	              prevStep.classList.add('active');
	          }
	      }
		