document.addEventListener("turbo:load", function() {
    console.log("Form validation script loaded."); // Debugging line
  
    $('form.needs-validation').submit(function(event) {
      var expiry = $('#card_expiry').val();
      console.log("Expiry date entered:", expiry); // Debugging line
  
      if (!isValidExpiryDate(expiry)) {
        console.log("Invalid expiry date."); // Debugging line
        alert('Please enter a valid expiration date in MM/YY format.');
        event.preventDefault();
      } else {
        console.log("Valid expiry date."); // Debugging line
      }
    });
  
    function isValidExpiryDate(value) {
        var match = value.match(/^(0[1-9]|1[0-2])\/([0-9]{2})$/);
        if (!match) return false;
    
        var today = new Date();
        var month = parseInt(match[1], 10) - 1; // 0-indexed month
        var year = parseInt('20' + match[2], 10);
        var expiryDate = new Date(year, month);
    
        return expiryDate > today;
      }
    });
    