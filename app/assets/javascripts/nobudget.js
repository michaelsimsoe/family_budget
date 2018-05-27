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
		      title: 'Title on Popover',
		      description: 'Body of the popover',
		      position: 'left'
		    }
		  },
		  {
		    element: '#create-budget',
		    popover: {
		      title: 'Title on Popover',
		      description: 'Body of the popover',
		      position: 'top'
		    }
		  },
		  {
		    element: '#dummy-request',
		    popover: {
		      title: 'Title on Popover',
		      description: 'Body of the popover',
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
		      description: `
						<button class="btn btn-primary btn-lg finished-tour">Get Started</button>
		      `,
		    }
		  },
		]);

		driver.start();
	}

});