$(document).ready(function() {

	const driver = new Driver({
		opacity: 0.55,
		allowClose: false,
		animate: true,
		keyboardControl: true,
		overlayClickNext: true,
	});
	
	// Start the introduction
	const firstTimeForUser = $('#first-time').attr('data-first');
	console.log(firstTimeForUser)
	if (firstTimeForUser == "true") {
		// Define the steps for introduction
		driver.defineSteps([
		  {
		    element: '#start-info',
		    popover: {
		      title: 'Lets go through the Basics',
		      description: 'The Family Budget has these three components.',
		      position: 'top'
		    }
		  },
		  {
		    element: '#create-budget',
		    popover: {
		      title: 'Create your own Budget',
		      description: 'Or request membership to an allready excisting one.',
		      position: 'top'
		    }
		  },
		  {
		    element: '#dummy-request',
		    popover: {
		      title: 'If you know about a Budget',
		      description: 'You can request to join it here.',
		      position: 'bottom'
		    }
		  },
		  {
		    element: '#dummy-invitation',
		    popover: {
		    	doneBtnText: 'Finished',
		      title: 'Title on Popover',
		      showButtons: false,
		      allowClose: false,
		      title: "Continue",
		      description: 'Click on any button or create a budget to end this tutorial.' ,
		    }
		  },
		]);

		driver.start();
	}

});