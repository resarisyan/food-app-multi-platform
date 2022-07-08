if (window.localStorage.getItem("mode") == "dark") {
    darkmode();
} else {
    nodark();
}

function changeTheme(){
    let checkbox = document.getElementById("change-theme");
    if (checkbox.checked) {
        darkmode(); 
    } else {
        nodark();
    }
}

function darkmode() {
    document.getElementById("navbar").classList.remove("navbar-light");
    document.getElementById("sidebar").classList.remove("sidebar-light");

    document.getElementById("body").classList.add("dark-mode");
    document.getElementById("navbar").classList.add("navbar-dark");
    document.getElementById("sidebar").classList.add("sidebar-dark-primary");
    
    document.getElementById("change-theme").checked = true;
    window.localStorage.setItem("mode", "dark");
}

function nodark() {
    document.getElementById("body").classList.remove("dark-mode"); 
    document.getElementById("navbar").classList.remove("navbar-dark");
    // document.getElementById("sidebar").classList.remove("sidebar-dark-primary");

    document.getElementById("navbar").classList.add("navbar-light");
    document.getElementById("sidebar").classList.add("sidebar-light");

    document.getElementById("change-theme").checked = false;
    window.localStorage.setItem("mode", "light"); 
}