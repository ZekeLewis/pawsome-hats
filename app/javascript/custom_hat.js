document.addEventListener('DOMContentLoaded', function() {

    function updateDescription() {
      var description = document.getElementById('hat_description');
      var selectedOptions = [];
  
      document.querySelectorAll('.option-group').forEach(function(option) {
        if (option.checked) {
          selectedOptions.push(option.value);
        }
      });
  
      description.value = 'Custom Hat: ' + selectedOptions.join(', ');
    }
  
    document.querySelectorAll('.option-group').forEach(function(option) {
      option.addEventListener('change', updateDescription);
    });
  });