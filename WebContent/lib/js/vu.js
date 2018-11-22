function myFunction() 
{
    var txt;
    if (confirm("Bạn có chắc nuốn xóa!")) 
    {
        
    } 
    else 
    {
        
    }
   // document.getElementById("xoabt").innerHTML = txt;
}


function myFunctionSearch() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {
    var myDropdown = document.getElementById("myDropdown");
      if (myDropdown.classList.contains('show')) {
        myDropdown.classList.remove('show');
      }
  }
}