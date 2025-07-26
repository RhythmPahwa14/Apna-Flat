// Menu icon and navbar interaction
const menu = document.querySelector('#menu-icon');
const navbar = document.querySelector('.navbar');

if (menu && navbar) {
    // Toggle classes for menu icon and navbar
    menu.addEventListener('click', () => {
        menu.classList.toggle('bx-x');
        menu.classList.toggle('active');
        navbar.classList.toggle('active');
    });

    // Remove classes on scroll
    window.addEventListener('scroll', () => {
        menu.classList.remove('bx-x');
        menu.classList.remove('active');
        navbar.classList.remove('active');
    });
}

// ScrollReveal settings
const scrollRevealSettings = {
    distance: '60px',
    duration: 2500,
    delay: 400,
    reset: true,
};

// Initialize ScrollReveal
const sr = ScrollReveal(scrollRevealSettings);

// Apply ScrollReveal animations
sr.reveal('.text', { delay: 200, origin: 'top' });
sr.reveal('.form-container form', { delay: 800, origin: 'left' });
sr.reveal('.heading', { delay: 800, origin: 'top' });
sr.reveal('.services-container .box', { delay: 600, origin: 'top' });
sr.reveal('.about-container', { delay: 600, origin: 'top' });
sr.reveal('.reviews-container', { delay: 600, origin: 'top' });
sr.reveal('.newsletter .box', { delay: 400, origin: 'bottom' });

// Form container and form validation
const formContainer = document.querySelector('.form-container form');

if (formContainer) {
    formContainer.addEventListener('submit', function(event) {
        const searchInput = formContainer.querySelector('input[type="search"]');
        if (!searchInput.value.trim()) {
            alert('Please enter a location to search.');
            event.preventDefault(); // Prevent form submission if input is empty
        }
    });
}
